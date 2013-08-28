class AddTagIndexToGames < ActiveRecord::Migration
  def change
    add_index :games, :tags, using: 'gin'
  end
end
