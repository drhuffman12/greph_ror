class FoundFile < ActiveRecord::Base
  has_many :found_lines
  has_many :grep_result_entries
  # has_many :grep_result_entries_found_files
  # has_many :grep_result_entries, through: :grep_result_entries_found_files
  has_many :grep_raws, through: :grep_result_entries

  # before_save do
  #   update_counts
  # end

  def update_counts
    self.search_term_list = search_terms
    self.search_term_count = search_terms.count
    self.result_entry_count = grep_result_entries.count
  # end
  #
  # def update_line_counts
    self.file_line_count = self.try(:found_lines).try(:count) || 0
  end

  def search_terms
    # grep_result_entries.select('id,grep_raw_id').find_each.map{|gre| gre.grep_raw.search_term }
    grep_raws.select('search_term').all.map {|gr| gr.search_term}.sort.uniq
  end

end
