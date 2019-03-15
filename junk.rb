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