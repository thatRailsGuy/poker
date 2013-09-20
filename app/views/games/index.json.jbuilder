json.array!(@all_games) do |game|
  json.extract! game, :name, :description, :style_id, :min_players, :max_players, :num_cards, :tags
  json.url game_url(game, format: :json)
end
