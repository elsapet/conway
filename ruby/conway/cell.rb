class Cell

  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def next_state(neighbours = [])
    living_neighbours = neighbours.select(&:alive?)

    if alive?
      # stays alive if between 2 and 3 neighbours
      living_neighbours.size.between?(2, 3)
    else
      # revives if exactly 3 neighbours
      living_neighbours.size == 3
    end
  end

  def to_s
    alive? ? "o" : "."
  end

  def alive?
    state
  end
end
