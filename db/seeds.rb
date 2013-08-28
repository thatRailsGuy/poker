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