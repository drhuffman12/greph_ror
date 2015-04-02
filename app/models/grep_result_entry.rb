class GrepResultEntry < ActiveRecord::Base

  belongs_to :grep_raw
  belongs_to :found_file
  belongs_to :found_line

  # has_many :grep_result_entries_found_files
  # has_many :grep_result_entries_found_lines

  # has_many :found_files, through: :grep_result_entries_found_files
  # has_many :found_lines, through: :grep_result_entries_found_lines
=begin
  before_save do
    ff = FoundFile.find_or_create_by(:found_file_path => self.found_file_path)
    fl = FoundLine.find_or_create_by(:found_file_id => ff.id, :found_line_num => self.found_line_num)

    self.found_file_id = ff.id
    self.found_line_id = fl.id

    # GrepResultEntriesFoundFile.find_or_create_by(:grep_result_entry_id => self.id, :found_file_id => ff.id)
    # GrepResultEntriesFoundLine.find_or_create_by(:grep_result_entry_id => self.id, :found_line_id => fl.id)
  end
=end

  after_destroy do
    self.found_file.update_counts
    self.found_line.update_counts
  end
end
