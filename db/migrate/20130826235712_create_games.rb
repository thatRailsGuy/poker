class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description, default: "Description:
      -

      {description goes here}
      
      Related Games:
      -
      [game:sample]

      Walkthrough:
      -

      {sample walkthrough to be replaced
      Initial deal - 

       * player 1 - [card:ace of spades][card:two of spades]
       * player 2 - [card:ace of clubs][card:two of clubs]
       * player 3 - [card:ace of hearts][card:two of hearts]

      Round of betting

      Deal a community card - [card:king of diamonds]

      Round of betting

      Declare winner
      }"
      t.belongs_to :style, index: true
      t.integer :min_players
      t.integer :max_players
      t.integer :num_cards
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end
