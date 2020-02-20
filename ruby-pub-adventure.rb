## This project is inspired by the exercises outlined in Project 5 "Ruby for Kids" by Chris Haupt
## Adapted by Sally Baker 
## A text adventure game 
## ==================================================================================
## Start of functions
# Create a pub 
def pub_statement(current_pub, pub_description, drinks_cost, wallet, drink) 
	puts "You're at #{current_pub} #{pub_description(current_pub)}." 
	puts "#{drink} costs: $#{drinks_cost}. You have $#{wallet}" 
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
		"on the balcony"
	elsif current_pub == "The Fox"
		"rooftop bar"
	elsif current_pub == "Lock'n'Load"
		". Live music is playing"
	elsif current_pub == "The Norman"
		"beer garden"
	elsif current_pub == "The Pineapple"
		"5th Quarter bar booth"
	elsif current_pub == "The Story Bridge Hotel"
		"Shelter Bar"
	elsif current_pub == "The Breakfast Creek Hotel"
		"beer garden"
	elsif current_pub == "The Victory"
		"Karoake bar"
	else
		". " 
	end	
end
def drinks_cost?(current_pub)	
	if current_pub == "The Regatta"
		drinks_cost = 16
	elsif current_pub == "The Fox"
		drinks_cost = 8
	elsif current_pub == "Lock'n'Load"
		drinks_cost = 12
	elsif current_pub == "The Norman"
		drinks_cost = 10
	elsif current_pub == "The Pineapple"
		drinks_cost = 14
	elsif current_pub == "The Story Bridge Hotel"
		drinks_cost = 12
	elsif current_pub == "The Breakfast Creek Hotel"
		drinks_cost = 12
	elsif current_pub == "The Victory"
		drinks_cost = 6
	else
		drinks_cost = 10 
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
def passed_out?
	if roll_dice(2,6) >= 12
		true
	else
		false
	end
end
# Check for treasure 
def has_treasure?
	if roll_dice(2,6) >= 4
    	true
  	else
    	false
  	end
end
# Determine what treasure is found 
def new_treasure 
	["Rolex watch", "$50", "an old sock", "a beer coaster"].sample
end 
# check for shots 
def shots? 
	if roll_dice(2,6) >= 10
		true
	else
		false
	end
end
def water?(drink)
	while drink == "water"
	puts "No really, what alcholic drink do you prefer?"
	drink = gets.chomp
	return drink
	end
end
def maxed_out?(drinks, max_drinks)  
	if drinks >= max_drinks
		true
	else 
		false
	end
end
def goes_home?(players)
	if roll_dice(2,6) >= 6
		true 
	else	
		false
	end
end
## End of functions 
## Start of Main Game 
# Starting variables
players = rand(5) + 1
drinks = 0
max_drinks = 15
drinks_cost = 10
pubs_visited = 1
wallet = 150
treasure_count = 0 
shots = false
shots_cost = drinks_cost * players
current_pub = pub_name
player_names = Array.new
actions = [
	"     l - look",
	"     m - move", 
	"     s - search", 
	"     d - drink", 
	"     shots - buy round of shots", 
	"     stats - check stats", 
	"     help - lists available actions", 
	"     q - quit"
]
line = "=================================================="
space = " "
# End of starting variables
# Start of narrative 
puts line
puts space
puts "Tonight you are going on a pub crawl! Try not to pass out."  
puts "#{players} friends have agreed to accompany you on this night of adventure." 
puts "To play, type one of the command choices on each turn:"
puts actions
puts "But before we begin, what do you prefer to drink? (Beer, Wine, Hard Liquor, Water)"
drink = gets.chomp 
while drink == "water"
	drink = water?(drink)
end
pub_statement(current_pub, pub_description(current_pub), drinks_cost, wallet, drink) 
# End of starting narrative
# Main game loop
while players > 0
	# Conscious_check
	if passed_out?
		break
	end 
	# Shots check 
	if shots? 
		puts "Someone orders a round of shots!"
		puts "You drink"
		drinks = drinks + 1
		if passed_out?
			break
		end
	end
	if maxed_out?(drinks, max_drinks)
		break
	end
	## Player Actions 
	# List available actions for player
	print space
    print " > What do you do?"
    # Player inputs selected action
    player_action = gets.chomp
    # Handle player actions 
    if player_action == "q"
    	break
    elsif player_action == "l"
    	pub_statement(current_pub, pub_description(current_pub), drinks_cost, wallet, drink) 
    elsif player_action == "m"
    	current_pub = pub_name
    	drinks_cost = drinks_cost?(current_pub)
    	pubs_visited = pubs_visited + 1
    	pub_statement(current_pub, pub_description(current_pub), drinks_cost, wallet, drink) 
    elsif player_action == "s"
    	if has_treasure?
    		treasure = new_treasure
    		if treasure == "$50"
    			wallet += 50
    			puts "You found #{treasure}!"
    			puts "You now have $#{wallet} in your wallet"
    		else
    			puts "You found #{treasure}!"
				treasure_count = treasure_count + 1 
        		puts "Now you have #{treasure_count} treasures"
    		end	
      	else
        	puts "You look, but don't find anything."
      	end
    elsif player_action == "d"
    	if wallet >= drinks_cost 
    		puts "You drink another #{drink}"
    		drinks = drinks + 1
    		wallet = wallet - drinks_cost
    		if passed_out?
    			break
    		end
    		if maxed_out?(drinks, max_drinks)
    			break
    		end
    	else
    		puts "You don't have enough money."
    	end
    elsif player_action == "shots"
    	puts "A round of shots costs $#{shots_cost}"
    	if wallet < shots_cost
    		puts "You don't have enough money"
    	else
    		puts "Are you sure (Y/N)?"
    		check = gets.chomp
    		if check == "y"
    			puts "You buy a round of shots!"
    			drinks += 1
    			wallet = wallet - shots_cost
    			if passed_out?
    				break
    			end
    			if maxed_out?(drinks, max_drinks)
    				break
    			end
    		end
    	end
    elsif player_action == "stats"
		puts "Drinks consumed: #{drinks}"
		puts "Pubs visited: #{pubs_visited}"
		puts "Wallet: #{wallet}"
		puts "Treasure count: #{treasure_count}" 
	elsif player_action == "help"
		puts actions
	else 
		puts "That doesn't work. Try again."
	end
	if goes_home?(players) == true 
		players -= 1
	end
end 
if players == 0
	puts "Congratulations! You outlasted your mates with your iron stomach and determination"
	puts "You visited #{pubs_visited} pubs"
	puts "and collected #{treasure_count} treasures"
elsif player_action == "q"
	"Thank you. Come again."
elsif
	puts "Oh No! You passed out!"
	puts "You could only handle #{pubs_visited} pubs and drank #{drinks} #{drink}."
	puts "Better drink more responsibly next time" 
else
	puts "The End"
end
# End of narrative
## End of Main Game
#TODO:  
# randomly decide to call an uber 
# if the player gets too drunk or everyone goes home - display end message 
# randomly decide on happy hour and cheap drinks 
# add treasure to an inventory 


