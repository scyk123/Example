class Automaton

  def initialize(size, rule, step = 0, skip = 0, initial = nil)
    raise 'Automaton must be an odd size!' if size % 2 == 0
    @rule, @skip = rule, skip
    set_display(size, initial)
    skip_step(skip)
    show
    advance_step(step)
  end

  def set_display(size, initial = nil)
    if initial.kind_of?(Array)
      @display = initial
    else
      @display = Array.new(size, 0)
      @display[size / 2] = 1
    end
  end

  def skip_step n
    for i in 0...n
      do_step
    end
  end

  def advance_step n
    for i in 0...n
      do_step
      show
    end
  end

  def advance_in_time n, t
    for i in 0...n
      advance_step(1)
      sleep(t)
    end
  end

  def do_step
    next_step, top = [], @display.size - 1
    for i in 0..top do
      top_wrap = (i == top) ? 0 : i + 1
      comp = 1 << match_bit(@display[i - 1], @display[i], @display[top_wrap])
      on = (@rule & comp) > 0
      next_step << (on ? 1 : 0)
    end
    @display = next_step
  end

  def match_bit(l, c, r)
    0 + (r << 0) + (c << 1) + (l << 2)
  end

  def show
    for i in 0...@display.size
      print(@display[i] == 0 ? ' ' : '*')
    end
    puts
  end

end