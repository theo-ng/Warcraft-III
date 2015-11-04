require_relative 'spec_helper'
# Stats:

# AP: 50
# HP: 400

describe SiegeEngine do

  before :each do
    @siege = SiegeEngine.new
  end

  describe "#initialize" do

    it "has and knows its HP (health points)" do
      expect(@siege.health_points).to eql(400)
    end

    it "has and knows its AP (attack power)" do
      expect(@siege.attack_power).to eql(50)
    end

  end

end