class GuessingGame

  def initalize
    @high, @guess, @guess_count, @the_number = 0, 0, 0, 0
  end

  def play_again
    reset_game
    set_vars
    do_guesses
    puts "RIGHT! It took you #{@guess_count} tries."
    print 'Would you like to play again? [y/n]: '
    gets.chomp == 'y'
  end

  private
  def reset_game
    @high, @guess, @guess_count, @the_number = 0, 0, 0, 0
    puts
  end

  def set_vars
    while @high < 1
      print 'You are guessing from 1 to (n > 0): '
      @high = gets.chomp.to_i
      puts 'Invalid input, choose a number > 0' if @high < 1
    end
    @the_number = rand(1..@high)
  end

  def do_guesses
    while @guess != @the_number do
      report_last_guess
      @guess = gets.chomp.to_i
      @guess_count += 1
    end
  end

  def report_last_guess
    if @guess_count == 0
      print "Guess a number between 1 and #{@high}: "
    else
      print "Too #{@guess < @the_number ? 'low' : 'high'}. Try again: "
    end
  end

end