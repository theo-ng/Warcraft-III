require_relative 'spec_helper'
# Stats:
# Cost: 200 gold, 60 lumber, 3 food

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#build_siege_engine" do
    it "costs 200 gold" do
      @barracks.build_siege_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 5 food" do
      @barracks.build_siege_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

    it "costs 60 lumber" do
      @barracks.build_siege_engine
      expect(@barracks.lumber).to eq(40) # starts at 100
    end

    it "produces a siege engine unit" do
      siege = @barracks.build_siege_engine
      expect(siege).to be_an_instance_of(SiegeEngine)
    end
  end

  describe "#can_build_siege_engine?" do
    it "returns true if there are enough resources to train a siege" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple sieges
      expect(@barracks.can_build_siege_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 4 food items left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      # Make the barracks believe it only has 4 lumber items left, even though it starts with 80
      # This is done by overwriting the `lumber` getter method
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 89 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end
  end

  describe "#build_siege_engine" do
    it "does not train a siege if there aren't enough resources" do
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(false)
      expect(@barracks.build_siege_engine).to be_nil
    end
    it "trains a siege if there are enough resources" do
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(true)
      expect(@barracks.build_siege_engine).to be_a(SiegeEngine)
    end

  end

end