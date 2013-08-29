class Game < ActiveRecord::Base
  belongs_to :style
  
  def self.search_all(queries)
    games = Game.all
    queries.gsub(/\s+/m, ' ').strip.split(" ").each do |query|
     games1 = games.where("name @@ :q or description @@ :q", q: query)
     games2 = []
     games2 = games.where(style_id: Style.where("name @@ :q", q: query).first.id) unless Style.where("name @@ :q", q: query).empty?
     games3 = games.where("'#{query}' = ANY (tags)")
     games = games1+games2+games3
    end
    games
  end
  
  def self.search_any(queries)
    games = []
    queries.gsub(/\s+/m, ' ').strip.split(" ").each do |query|
     games += where("name @@ :q or description @@:q", q: query)
    end
    games
  end
end
