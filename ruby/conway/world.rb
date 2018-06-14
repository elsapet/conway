require "./conway/cell"

class World

  DIMENSION = 25

  attr_accessor :rows, :initial_world

  def initialize(initial_world: nil)
    @initial_world = initial_world || generate_pseudorandom_world
    @rows = generate_rows
  end

  def generate_next
    next_rows = @rows.each_with_index.map do |row, i|
      row.each_with_index.map do |cell, j|
        next_state = cell.next_state(neighbours(i, j))
        Cell.new(next_state)
      end
    end

    @rows = next_rows
  end

  def to_s
    @rows.map { |row| row.join(" ") }.join("\n")
  end

  private

  attr_accessor :number_of_rows, :number_of_columns

  def neighbours(row, column)
    neighbours = []

    # upstairs
    if row > 0
      neighbours << @rows[row - 1][column - 1] if column > 0
      neighbours << @rows[row - 1][column]
      neighbours << @rows[row - 1][column + 1] if column < number_of_columns
    end

    # downstairs
    if row < number_of_rows - 1
      neighbours <<  @rows[row + 1][column - 1] if column > 0
      neighbours << @rows[row + 1][column]
      neighbours << @rows[row + 1][column + 1] if column < number_of_columns
    end

    # next door
    neighbours << @rows[row][column - 1] if column > 0
    neighbours << @rows[row][column + 1] if column < number_of_columns

    neighbours.compact
  end

  def generate_rows
    initial_world.map do |row|
      row.map do |cell|
        state = cell ? true : false
        Cell.new(state)
      end
    end
  end

  def generate_pseudorandom_world
    DIMENSION.times.map { DIMENSION.times.map { rand(10) %2 == 0 } }
  end

  def number_of_rows
    @number_of_rows ||= initial_world&.size || DIMENSION
  end

  def number_of_columns
    @number_of_columns ||= initial_world&.first&.size || DIMENSION
  end
end
