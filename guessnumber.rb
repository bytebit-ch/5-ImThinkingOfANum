require "./pythonicinput"

def guess_the_number_game
	how_many_guesses = pythonic_input("How many guesses would you like?").to_i
	start_time = Time.now.to_f
	range_start = pythonic_input("Start range").to_i
	end_range = pythonic_input("End range").to_i
	random_choice = rand(range_start..end_range)
	count = 0
	puts "You have #{how_many_guesses} to guess a random number between #{range_start} and #{end_range}"

	while count < how_many_guesses 
    	puts "guess a number"
    	user_choice = gets.to_i
		if user_choice == random_choice
			puts "You win"
			game_duration(start_time)
			break
		elsif count == how_many_guesses - 1
			puts "You lose. Random number was #{random_choice}"
			break
		elsif user_choice == random_choice - 2
			puts "Close, but Higher"
			count = count + 1
		elsif user_choice == random_choice + 2
			puts "Close, but Lower"
			count = count + 1
		elsif user_choice > random_choice
			puts "Lower"
			count = count + 1
		elsif user_choice < random_choice
			puts "Higher"
			count = count + 1
		end
	end
	
	play_again()
end

def game_duration(start_time)
	end_time = Time.now.to_f
	time_it_took = end_time - start_time
	print "It took you ", time_it_took, " seconds to finish game\n"
end

def play_again
	play_again = pythonic_input("Would you like to play again? Y/N").downcase.strip
	if play_again == "y"
		guess_the_number_game()
	end
end

guess_the_number_game()