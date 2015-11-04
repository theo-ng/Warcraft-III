require_relative 'spec_helper'
# Aside from gold and food, there is also the concept of lumber. Add lumber as a resource that the barracks can handle.

# A Barracks can start off with 500 lumber.

describe Barracks do

  before :each do
    @rax = Barracks.new
  end

  describe "#initialize" do

    it "starts off with 1000 gold resources" do
      expect(@rax.lumber).to eql(100)
    end

  end

end