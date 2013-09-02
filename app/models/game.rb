class Game < ActiveRecord::Base
  belongs_to :style
  default_scope :order => 'name'
  
  def self.search_all(queries)
    list = []
    queries.gsub(/\s+/m, ' ').strip.split(" ").each do |query|
      sublist = []
      sublist << search_name_or_description(query)
      sublist << search_style(Style.where("name @@ :q", q: query).first.id) unless Style.where("name @@ :q", q: query).empty?
      sublist << search_tags(query)
      list << "(#{sublist.join(" OR ")})"
    end
    where(list.join(" AND "))
  end

  private
  def self.search_name_or_description(query)
    "name @@ '#{query}' or description @@ '#{query}'"
  end
  
  def self.search_style(id)
    "style_id = #{id}"
  end
  
  def self.search_tags(query)
    "'#{query}' = ANY (tags)"
  end
end
