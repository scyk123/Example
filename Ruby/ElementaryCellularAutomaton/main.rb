require './automaton'

def main
  eca = Automaton.new(161, 30)
  eca.advance_in_time(9999, 0.1)
end

main