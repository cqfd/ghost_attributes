require 'spec_helper'

describe GhostAttributes do
  describe "#ghost_accessor" do
    before(:each) do
      class Hippo
        include GhostAttributes
        ghost_accessor :name
      end
      @hippo = Hippo.new
      @hippo.name = "Humphrey"
    end

    it "mimics attr_accessor" do
      @hippo.name.should == "Humphrey"
    end

    it "doesn't use instance variables" do
      @hippo.instance_variables.should == []
    end
  end
end
