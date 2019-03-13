## This project is inspired by the exercises outlined in Project 5 "Ruby for Kids" by Chris Haupt
## Adapted by Sally Baker 
## A text adventure game 
## ==================================================================================
## Start of functions 

## End of functions 
## Start of Main Game 
# Starting variables
drinks = 0
max_drinks = 15
pubs_visited = 1
treasure_count = 0 
passed_out = false
shots = false
current_pub = " "
player_names = Array.new
puts "Tonight you are going on a pub crawl!"
puts "Collect treasure and try not to pass out." 
puts "To play, type one of the command choice on each turn."
# ToDo: prompt for drink preference 
puts "How many friends are in?"
players = gets.to_i
# End of starting variables
# Start of narrative 
1.upto(players) do #|something|
	puts "#{players} friends have agreed to accompany you on this night of adventure." 
	puts "What are their names?"
	puts "Enter name: "
	#add string to the end of an array 
	player_name = gets.chomp
	player_names.push(player_name)
end 
puts "Okay, so we know who's here. Let's play!"
puts " " 
puts " "
while players > 0 and not passed_out
	#game code 
	plassed_out = true
	break
end 
if players == 0
	puts "Congratulations! You outlasted your mates with your iron stomach and determination"
	puts "You visited #{pubs_visited} pubs"
	puts "and collected #{treasure_count} treasures"
else
	puts "Oh No! You passed out!"
	puts "You could only handle #{pubs_visited} pubs and drank #{drinks} beers" #once drink preference is established fix this line
	puts "Better luck next time" 
end

# End of narrative
## End of Main Game

# check to see if player is still on their feet 
# check to see if everyone is still here 
# look for treasure 
# drink another beer 
# leave the pub and go to another pub 
# pub descriptions 
# randomly decide on treasure 
# randomly decide on shots 
# randomly decide to call an uber 
# if the player gets too drunk or everyone goes home - display end message 


