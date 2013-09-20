response.headers["Content-Disposition"] = 'attachment; filename="games.csv"'

CSV.generate do |csv|
  csv << Game.columns.map {|c| c.name }
  @all_games.each do |game|
    csv << game.attributes.values
  end
end