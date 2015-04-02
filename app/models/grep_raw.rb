require 'open3'

class GrepRaw < ActiveRecord::Base

=begin
      t.string :search_term
      t.string :search_path
      t.text :result_set
      t.text :error_log
=end

  belongs_to :grep_multi
  has_many :grep_result_entries, :dependent => :destroy

  # validates_presence_of :search_term, uniqueness: true
  # validates_presence_of :search_path, uniqueness: true
  validates_presence_of :search_term
  validates_presence_of :search_path

  validate :validate_search_path

  validates_uniqueness_of :search_path, :scope => [:search_term]

  before_save :run
  after_save :split_result_set

=begin

  before_create do
    # validate_search_term
    validate_search_path
  end

  def validate_search_term
    GrepRaw.where(:search_term => search_term, :search_path => search_path, :id => self.id).count
  end

=end

  def validate_search_path
    self.search_path = File.expand_path(self.search_path)
    File.exists?(self.search_path)
  end

  def run
    self.cmd = "grep -rnI \"#{self.search_term}\" \"#{self.search_path}\""
    # result_set, error_log = Open3.capture2([env,] cmd... [, opts])
    begin
      self.result_set, self.error_log = ::Open3.capture2(cmd)
    rescue Exception => e
      self.error_log = self.error_log.to_s + {:message => e.message, :backtrace => e.backtrace}.to_s
    end

  end

  def split_result_set
    run
    # GrepResultLine.destroy_all(:grep_raw_id => self.id)
    GrepResultEntry.destroy_all(:grep_raw_id => self.id)
    self.result_set.each_line do |line|
      line_parts = line.split(':')
      found_file_path = line_parts.shift
      found_line_num = line_parts.shift
      found_line_string = line_parts.join(':')

=begin
      t.integer :grep_raw_id
      t.string :found_file_path
      t.integer :found_line_num
      t.string :found_line_string
=end
      # GrepResultLine.create(:grep_raw_id => self.id, :found_file_path => found_file_path, :found_line_num => found_line_num, :found_line_string => found_line_string)
      # GrepResultEntry.create(:grep_raw_id => self.id, :found_file_path => found_file_path, :found_line_num => found_line_num, :found_line_string => found_line_string)

      raise "File Path Error: '#{found_file_path}'" unless (File.exists?(found_file_path))
      ff = FoundFile.find_or_create_by(:found_file_path => found_file_path)
      fl = FoundLine.find_or_create_by(:found_file_id => ff.id, :found_line_num => found_line_num, :found_line_string => found_line_string)

      gre = GrepResultEntry.create(:grep_raw_id => self.id, :found_file_id => ff.id, :found_line_id => fl.id)
      gre.save

      fl.update_counts
      ff.update_counts
      fl.save
      ff.save

    end
  end

end
