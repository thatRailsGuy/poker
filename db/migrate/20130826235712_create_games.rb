class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description, default: "Description:\n-\n\n{description goes here}\nRelated Games:\n-\n[game:sample]\n\nWalkthrough:\n-\n\n{sample walkthrough to be replaced\nInitial deal - \n\n * player 1 - [card:ace of spades][card:two of spades]\n * player 2 - [card:ace of clubs][card:two of clubs]\n * player 3 - [card:ace of hearts][card:two of hearts]\n\nRound of betting\n\nDeal a community card - [card:king of diamonds]\n\nRound of betting\n\nDeclare winner\n}"
      t.belongs_to :style, index: true
      t.integer :min_players
      t.integer :max_players
      t.integer :num_cards
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end
