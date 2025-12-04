require "rspec"
require_relative "parking_system"

RSpec.describe ParkingSystem do
  let(:ps) { ParkingSystem.new(1, 1, 1) }

  describe "#add_car" do
    it "allows adding a big car when space is available" do
      expect(ps.add_car(1)).to eq(true)
    end

    it "allows adding a medium car when space is available" do
      expect(ps.add_car(2)).to eq(true)
    end

    it "allows adding a small car when space is available" do
      expect(ps.add_car(3)).to eq(true)
    end

    it "returns false when big car space is full" do
      ps.add_car(1)
      expect(ps.add_car(1)).to eq(false)
    end

    it "returns false when medium car space is full" do
      ps.add_car(2)
      expect(ps.add_car(2)).to eq(false)
    end

    it "returns false when small car space is full" do
      ps.add_car(3)
      expect(ps.add_car(3)).to eq(false)
    end

    it "properly decrements counts for each car type independently" do
      ps.add_car(1)
      ps.add_car(2)
      ps.add_car(3)

      expect(ps.add_car(1)).to eq(false)
      expect(ps.add_car(2)).to eq(false)
      expect(ps.add_car(3)).to eq(false)
    end

    it "handles multiple additions of different car types" do
      ps = ParkingSystem.new(2, 1, 1)

      expect(ps.add_car(1)).to eq(true)
      expect(ps.add_car(1)).to eq(true)
      expect(ps.add_car(1)).to eq(false)

      expect(ps.add_car(2)).to eq(true)
      expect(ps.add_car(2)).to eq(false)

      expect(ps.add_car(3)).to eq(true)
      expect(ps.add_car(3)).to eq(false)
    end

    it "returns nil / falsey for invalid car types" do
      expect(ps.add_car(99)).to eq(false)
      expect(ps.add_car(0)).to eq(false)
      expect(ps.add_car(-1)).to eq(false)
    end
  end
end
