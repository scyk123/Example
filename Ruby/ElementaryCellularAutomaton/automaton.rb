# http://mathworld.wolfram.com/ElementaryCellularAutomaton.html
class Automaton

  # size: the length of the 1d array
  # rule: byte (0-255) that dictates changes through generations
  # step: advance this many generations after initialize, printing each time
  # skip: advance this many generations after initialize, don't print anything
  # initial: override @display to this value
  def initialize(size, rule, step = 0, skip = 0, initial = nil)
    # Fail if the size is not 0 and is even
    raise 'Automaton must be an odd size!' if size != 0 && size % 2 == 0

    # Rule needs to be 8 bits max
    raise 'Invalid rule!' if rule < 0 || rule > 255
    @rule = rule

    set_display(size, initial)   # init @display
    skip_step(skip)   # skip steps if needed
    show   # print after skipping
    advance_step(step)   # advance after printing the first
  end

  # size: length of the 1d array
  # initial: set @display to this value if an array, ignoring size
  def set_display(size, initial = nil)
    if initial.kind_of?(Array)
      @display = initial
    else
      @display = Array.new(size, 0)
      @display[size / 2] = 1   # sets the middle index on
    end
  end

  # n: number of generations to skip
  def skip_step n
    for i in 0...n
      do_step
    end
  end

  # similar to skip_step but prints each line
  # n: number of generations to advance
  def advance_step n
    for i in 0...n
      do_step
      show
    end
  end

  # call advance_step and wait between each step
  # n: number of generations to advance
  # t: time in seconds between generations
  def advance_in_time n, t
    for i in 0...n
      do_step
      show
      sleep(t)
    end
  end

  # meat and potatoes, updates @display to the next generation
  def do_step
    # store the return array and the max @display index
    next_step, top = [], @display.size - 1
    for i in 0..top do
      top_wrap = (i == top) ? 0 : i + 1   # wrap back to 0 when i hits top

      # calculate how much to shift a bit to match against the rule
      comp = 1 << match_bit(@display[i - 1], @display[i], @display[top_wrap])

      # check that the rule contains the same bit
      # ex: 00111010(@rule) & 00000010(comp) = 2
      on = (@rule & comp) > 0
      next_step << (on ? 1 : 0)   # add the calculated bit to the return array
    end
    @display = next_step   
  end

  # left, center, right: the cell (center) and its neighbors
  # ex: match_bit(1, 0, 1) = 0b101 = 5, match_bit(0, 0, 1) = 0b001 = 1 
  def match_bit(left, center, right)
    (left << 2) + (center << 1) + (right << 0)
  end

  # display the automatons current state
  def show
    for i in 0...@display.size
      print(@display[i] == 0 ? ' ' : '*')
    end
    puts
  end

end