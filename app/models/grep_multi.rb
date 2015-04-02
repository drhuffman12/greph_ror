class GrepMulti < ActiveRecord::Base
  has_many :grep_raws, :dependent => :destroy
  after_save :gen_grep_raws

  before_create do
    self.search_terms = sorted_unique_lines_sing_plur_cam_und(self.search_terms)
    self.search_paths = sorted_unique_lines(self.search_paths)
  end

  def sorted_unique_lines(txt)
    ((txt.to_s.gsub("\r\n","\n").gsub("\n\n","\n").split("\n").sort.uniq) - [nil] - ['']).join("\n").gsub("\n\n","\n")
  end

  def sorted_unique_lines_sing_plur_cam_und(txt)
    ((txt.to_s.gsub("\r\n","\n").gsub("\n\n","\n").split("\n").sort.uniq).map {|t| sing_plur_cam_und(t) } - [nil] - ['']).flatten.sort.uniq.join("\n").gsub("\n\n","\n")
  end

  def sing_plur_cam_und(txt)
    [txt,txt.singularize,txt.pluralize].collect{|t| [t,t.camelize,t.underscore]}.sort.uniq.flatten
  end

  def gen_grep_raws
    # GrepResultLine.destroy_all(:grep_raw_id => self.id)
    self.search_terms.split("\n").each do |search_term|
      self.search_paths.split("\n").each do |search_path|
        # GrepRaw.find_or_create_by(:search_term => search_term, :search_path => search_path)
        # GrepRaw.destroy_all(:search_term => search_term, :search_path => search_path)
        GrepRaw.create(:grep_multi_id => self.id, :search_term => search_term, :search_path => search_path)
      end
    end
  end


end
