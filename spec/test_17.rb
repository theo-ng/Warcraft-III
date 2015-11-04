require_relative 'spec_helper'
# The SiegeEngine is very effective against buildings such as the Barracks. It is however ineffective against other units (can't attack them, as though they were dead).

# So unlike with Footman (whose attacks do a fraction of the damage they normally would), the SiegeEngine does 2x the damage against the Barracks

# Also, Siege Engines can attack other siege engines even though they cannot attack any other units (such as Peasants or Footmen)

describe SiegeEngine do

  before :each do
    @siege = SiegeEngine.new
    @siege2 = SiegeEngine.new
    @barracks = Barracks.new
    @peasant = Peasant.new
    @unit = Unit.new(0, 1)
  end

  describe "#attack!" do

    it "should deal normal (AP) damage to a SiegeEngine" do
      @siege.attack!(@siege2)
      expect(@siege2.health_points).to eql(350) #initial 400
    end

    it "should deal double (AP) damage to a Barracks" do
      @siege.attack!(@barracks)
      expect(@barracks.health_points).to eql(400) #initial 500
    end

    it "should raise an InvalidAttackError when attacking a Unit other than SiegeEngine" do
      expect { @siege.attack!(@peasant) }.to raise_error(InvalidAttackError)
    end

    it "should not be able to attack if dead" do
      expect { @siege.attack!(@unit) }.to raise_error(InvalidAttackError)
    end

    it "should not be able to attack dead targets" do
      expect(@siege).to receive(:health_points).and_return(0)
      expect { @siege.attack!(@siege2) }.to raise_error(InvalidAttackError)
    end

  end

end