require "pry"
require "./conway/world"

describe World do
  let(:initial_world) { nil }

  subject(:world) { World.new(initial_world: initial_world) }

  describe "#to_s" do
    let(:initial_world) { [[false, false, false], [true, true, true], [false, false, false]] }

    it "outputs the expected" do
      expect(world.to_s).to eq(". . .\no o o\n. . .")
    end
  end

  describe "#generate_next" do
    let(:initial_world) { [[false, false, false], [true, true, true], [false, false, false]] }

    it "moves to the next pattern" do
      world.generate_next
      expect(world.to_s).to eq(". o .\n. o .\n. o .")
    end
  end
end
