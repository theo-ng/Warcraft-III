require_relative 'spec_helper'
# Units start off alive but they die if their HP hits 0 or lower. This is usually a result of receiving damage from combat.

# Implementation: Define a method dead? on the Unit class. We add it to Unit instead of Footman for example b/c all units can die, not just footman or peasants.

describe Unit do

  before :each do
    @unit = Unit.new(10, 2)
  end

  describe "#dead?" do

    it "should die when health hits 0" do
      @unit.damage(10)
      expect(@unit.dead?).to be_truthy
    end

  end

end