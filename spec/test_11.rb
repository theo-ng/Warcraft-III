require_relative 'spec_helper'

# In most strategy games, like Warcraft III, buildings can also be attacked by units. Since a barracks is a building, it has substantial more HP (500) To make matters worse, a Footman does only HALF of its AP as damage to a Barracks. This is because they are quite ineffective against buildings.

# Note: The damage amount should be an integer (Fixnum). Take the ceil division result.


describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#initialize" do

    it "has and knows its hp" do
      expect(@barracks.health_points).to eq(500)
    end

  end

  describe "#damage" do
    
    it "should take half the damage from Footman" do
      footman = Footman.new
      footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495) # footman ap = 10
    end

  end

end
