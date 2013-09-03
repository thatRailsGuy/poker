poker
=====

A repository of poker and other card game variances

Can see it in action here [http://poker-house.herokuapp.com/](http://poker-house.herokuapp.com/)


To import database from heroku: run this command from the folder, replacing username and database with the database name and username associated with the app from the database.yml:
    pg_restore --verbose --clean --no-acl --no-owner -h localhost -U username -d database latest.dump


TODO
========
Advanced Searches

Make search (by tag
							by style
							by name
							by number of players
							by cards)
							
Link to pick random game

Add custom pagination options

add testing