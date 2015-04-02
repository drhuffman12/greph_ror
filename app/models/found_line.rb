class FoundLine < ActiveRecord::Base

  belongs_to :found_file
  has_many :grep_result_entries

  # has_many :grep_result_entries_found_lines
  # has_many :grep_result_entries, through: :grep_result_entries_found_lines

  has_many :grep_raws, through: :grep_result_entries

  # before_save do
  #   update_counts
  # end
  #
  # after_save do
  #   found_file.update_line_counts
  # end

  def update_counts
    self.search_term_list = search_terms
    self.search_term_count = search_terms.count
    self.result_entry_count = grep_result_entries.count
  end

  def search_terms
    # grep_result_entries.select('id,grep_raw_id').find_each.map{|gre| gre.grep_raw.search_term }
    grep_raws.select('search_term').all.map {|gr| gr.search_term}.sort.uniq
  end

end
