class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, array: true
      t.text :description
      t.belongs_to :style, index: true
      t.integer :min_players
      t.integer :max_players
      t.integer :num_cards
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end
