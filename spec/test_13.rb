require_relative 'spec_helper'
#A dead unit cannot attack another unit. Conversely, an alive unit will also not attack another unit that is already dead.

describe Unit do

  before :each do
    @unit = Footman.new
    @unit2 = Footman.new
  end

  describe "#attack!" do

    it "should not be able to attack if dead" do
      expect(@unit2).to receive(:health_points).and_return(0)
      expect { @unit2.attack!(@unit) }.to raise_error(InvalidAttackError)
    end

    it "should not be able to attack dead targets" do
      expect(@unit2).to receive(:health_points).and_return(0)
      expect { @unit.attack!(@unit2) }.to raise_error(InvalidAttackError)
    end

  end

end