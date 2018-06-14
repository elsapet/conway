require "pry"
require "./conway/world"

class Conway
  def self.play(initial_world = nil)
    world = World.new(initial_world: initial_world)

    while(true) do
      puts world

      world.generate_next
      sleep(1)

      clear_screen
    end
  end

  private

  def self.clear_screen
    puts "\e[H\e[2J"
  end
end
