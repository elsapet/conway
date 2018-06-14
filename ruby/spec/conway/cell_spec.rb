require "pry"
require "./conway/cell"

describe Cell do
  let(:state) { nil }

  subject(:cell) { Cell.new(state) }

  describe "#initialize" do
    it "creates a Cell" do
      expect(cell).to be_a(Cell)
    end
  end

  describe "#next_state" do
    context "given a living cell" do
      let(:state) { true }

      context "with 0 neighbours" do
        let(:neighbours) { [] }

        it "dies" do
          expect(cell.next_state(neighbours)).to be_falsey
        end
      end

      context "with 1 living neighbour" do
        let(:neighbours) { [Cell.new(true), Cell.new(false)] }

        it "dies" do
          expect(cell.next_state(neighbours)).to be_falsey
        end
      end

      context "with 2 to 3 living neighbours" do
        let(:neighbours) { [Cell.new(true), Cell.new(true), Cell.new(false)] }

        it "stays alive" do
          expect(cell.next_state(neighbours)).to be_truthy
        end
      end

      context "with 4+ living neighbours" do
        let(:neighbours) { [Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true)] }

        it "dies" do
          expect(cell.next_state(neighbours)).to be_falsey
        end
      end
    end

    context "given a dead cell" do
      let(:state) { false }

      context "with 0 neighbours" do
        let(:neighbours) { [] }

        it "does not revive" do
          expect(cell.next_state(neighbours)).to be_falsey
        end
      end

      context "with 3 living neighbours" do
        let(:neighbours) { [Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(false)] }

        it "revives" do
          expect(cell.next_state(neighbours)).to be_truthy
        end
      end

      context "with 4+ living neighbours" do
        let(:neighbours) { [Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true)] }

        it "does not revive" do
          expect(cell.next_state(neighbours)).to be_falsey
        end
      end
    end
  end

  describe "#to_s" do
    context "given a living cell" do
      let(:state) { true }

      it "outputs the expected" do
        expect(cell.to_s).to eq("o")
      end
    end

    context "given a dead cell" do
      let(:state) { false }

      it "outputs the expected" do
        expect(cell.to_s).to eq(".")
      end
    end
  end

  describe "#alive?" do
    context "given a living cell" do
      let(:state) { true }

      it "is truthy" do
        expect(cell.alive?).to be_truthy
      end
    end

    context "given a dead cell" do
      let(:state) { false }

      it "is falsey" do
        expect(cell.alive?).to be_falsey
      end
    end
  end
end
