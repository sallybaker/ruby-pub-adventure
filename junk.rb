# TODO: wait for reponse (i.e. press enter) before continuing 
def ready?(ready)
	if ready == "y"
		return true
	else 
		return false
	end
end 

puts "Ready? (Y/N)"
ready = gets
puts ready?
puts space
puts line 

elsif ready == "n"
	puts "Smart move. You win!" #TODO: response if 

#names of friends
puts "What are their names?"
1.upto(players) do |row|
	puts "Enter name #{row}: "
	#add string to the end of an array 
	player_name = gets.chomp
	player_names.push(player_name)
end 
puts "Okay, now that's out of the way. Let's play!"

# Check to see if everyone is still here 
def friends_piked?
	if roll_dice(2,6) >= friends_piked_chance
		true
	else
		false
	end
end

"c - count friends"

elsif player_action == "c"

# pub_busy
def pub_busy?
	"The pub is #{crowd_numbers}."
end

puts pub_busy?

# help 
puts "Type 'help' to view full list of available actions"
