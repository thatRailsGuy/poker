# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Style.create!(:name => "Draw", :description => "Players receive an initial hand, then trade in cards a specified number of times in an attempt to improve their hand.")
Style.create!(:name => "Stud", :description => "Players receive a number of cards, then receive subsequent cards one at a time until the hand is complete.")
Style.create!(:name => "Community", :description => "Players receive a number of cards, then subsequent cards are dealt in the center of the table to be used by all players.")
Style.create!(:name => "Passing", :description => "Players receive an initial hand, then trade cards amongst themselves as instructed until the hand is complete in an attempt to improve their hand.")
Style.create!(:name => "Counting", :description => "Players receive a number of cards, then have the option to add addional cards. Play centers around counting cards towards a goal.")
Style.create!(:name => "Other", :description => "These games don't fit into the other categories.")

# Game.create(:name => "sample", :description => "[card:2 of spades]
# [card:3 of spades]
# [card:4 of spades]
# [card:5 of spades]
# [card:6 of spades]
# [card:7 of spades]
# [card:8 of spades]
# [card:9 of spades]
# [card:10 of spades]
# [card:jack of spades]
# [card:queen of spades]
# [card:king of spades]
# [card:ace of spades]
# 
# [card:2 of clubs]
# [card:3 of clubs]
# [card:4 of clubs]
# [card:5 of clubs]
# [card:6 of clubs]
# [card:7 of clubs]
# [card:8 of clubs]
# [card:9 of clubs]
# [card:10 of clubs]
# [card:jack of clubs]
# [card:queen of clubs]
# [card:king of clubs]
# [card:ace of clubs]
# 
# [card:2 of hearts]
# [card:3 of hearts]
# [card:4 of hearts]
# [card:5 of hearts]
# [card:6 of hearts]
# [card:7 of hearts]
# [card:8 of hearts]
# [card:9 of hearts]
# [card:10 of hearts]
# [card:jack of hearts]
# [card:queen of hearts]
# [card:king of hearts]
# [card:ace of hearts]
# 
# [card:2 of diamonds]
# [card:3 of diamonds]
# [card:4 of diamonds]
# [card:5 of diamonds]
# [card:6 of diamonds]
# [card:7 of diamonds]
# [card:8 of diamonds]
# [card:9 of diamonds]
# [card:10 of diamonds]
# [card:jack of diamonds]
# [card:queen of diamonds]
# [card:king of diamonds]
# [card:ace of diamonds]
# 
# [card:red joker]
# [card:black joker]", :style_id => 4)