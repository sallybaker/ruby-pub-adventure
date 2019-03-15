## This project is inspired by the exercises outlined in Project 5 "Ruby for Kids" by Chris Haupt
## Adapted by Sally Baker 
## A text adventure game 
## ==================================================================================
## Start of functions
# Create a pub 
def pub_statement(current_pub, pub_description) 
	"You're at #{current_pub} #{pub_description(current_pub)}" 
end
def pub_busy?
	"The pub is #{crowd_numbers}."
end
# Create Pub helper methods 
def pub_name
	pub_name = ["The Regatta", "The Fox", "Lock'n'Load", "The Norman", "The Pineapple", "The Story Bridge Hotel", "The Breakfast Creek Hotel", "The Victory"].sample
end 
def crowd_numbers
	["Quiet","Busy","Buzzing"].sample
end
def pub_description(current_pub)
	if current_pub == "The Regatta"
		"on the balcony."
	elsif current_pub == "The Fox"
		"rooftop bar."
	elsif current_pub == "Lock'n'Load"
		". Live music is playing."
	elsif current_pub == "The Norman"
		"beer garden."
	elsif current_pub == "The Pineapple"
		"5th Quarter bar booth."
	elsif current_pub == "The Story Bridge Hotel"
		"Shelter Bar."
	elsif current_pub == "The Breakfast Creek Hotel"
		"beer garden."
	elsif current_pub == "The Victory"
		"Karoake bar."
	else
		". " 
	end		
end 
# Roll the dice method 
def roll_dice(number_of_dice, size_of_dice)
  total = 0
  1.upto(number_of_dice) do
    total = total + rand(size_of_dice) + 1
  end
  return total
end
# check to see if player is still concious
def passed_out
	if roll_dice(2,6) >= concious_chance
		true
	else
		false
	end
end
# Check to see if everyone is still here 
def friends_piked?
	if roll_dice(2,6) >= friends_piked_chance
		true
	else
		false
	end
end
# Check for treasure 
def has_treasure?
	if roll_dice(2,6) >= 4 #TODO: chnage to has_treasure_chance when adding difficulty modes
    	true
  	else
    	false
  	end
end
# Determine what treasure is found 
def treasure 
	["Rolex watch", "$50", "An old sock", "A new beer coaster to add to the collection"].sample
end 
## End of functions 
## Start of Main Game 
# Starting variables
drinks = 0
max_drinks = 15
pubs_visited = 1
treasure_count = 0 #change this to Wallet and count down spending? If no money go home?
passed_out = false
shots = false
current_pub = pub_name
player_names = Array.new
line = "=================================================="
space = " "
# End of starting variables
# Start of narrative 
puts line
puts space
puts "Tonight you are going on a pub crawl!"
puts "Collect treasure and try not to pass out." 
puts "To play, type one of the command choice on each turn."
puts space
puts line
puts space
# ToDo: prompt for drink preference 
puts "How many friends are in?"
players = gets.to_i
puts "#{players} friends have agreed to accompany you on this night of adventure." 
puts space
puts line
puts space
puts "What are their names?"
1.upto(players) do |row|
	puts "Enter name #{row}: "
	#add string to the end of an array 
	player_name = gets.chomp
	player_names.push(player_name)
end 
puts space
# TODO: wait for reponse (i.e. press enter) before continuing 
puts "Okay, so we know who's here. Let's play!"
# End of starting narrative
# Main game loop
while players > 0 and not passed_out
	actions = ["m - move", "s - search", "c - count friends", "q - quit", "d - drink a beer" ]
	puts space
	puts line 
	puts space
	puts pub_statement(current_pub, pub_description(current_pub)) 
	puts pub_busy?
	puts "Drinks consumed: #{drinks}"
	puts "Pubs visited: #{pubs_visited}"
	#conscious_check
	if passed_out
		break
	end 
	## Player Actions 
	# List available actions for player
    print "What do you do?" 
    puts "(#{actions.join(', ')}): "
    # Player inputs selected action
    player_action = gets.chomp
    # Handle player actions 
    if player_action == "q"
    	break
    elsif player_action == "m"
    	current_pub = pub_name
    	pubs_visited += pubs_visited
    elsif player_action == "s"
    	if has_treasure?
        puts "You found #{treasure}!"
		treasure_count = treasure_count + 1 
        puts "Now you have #{treasure_count} treasures"
      else
        puts "You look, but don't find anything."
      end
    elsif player_action == "c"
    elsif player_action == "d"
    		puts "You drink another beer" #ToDo: maybe add a condiitonal - of beer count not sure after x beers
    		drinks += drinks
    		if passed_out
    			break
    		end
	end
end 
if players == 0
	puts "Congratulations! You outlasted your mates with your iron stomach and determination"
	puts "You visited #{pubs_visited} pubs"
	puts "and collected #{treasure_count} treasures"
elsif player_action == "q"
	"Thank you. Come again."
else
	puts "Oh No! You passed out!"
	puts "You could only handle #{pubs_visited} pubs and drank #{drinks} beers" #once drink preference is established fix this line
	puts "Better luck next time" 
end
# End of narrative
## End of Main Game
# Drink another beer 
# leave the pub and go to another pub 
# randomly decide on treasure 
# randomly decide on shots 
# randomly decide to call an uber 
# if the player gets too drunk or everyone goes home - display end message 