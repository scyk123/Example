require './guessing_game'

def main
  playing = true
  game = GuessingGame.new
  while playing
    playing = game.play_again
  end
end

main