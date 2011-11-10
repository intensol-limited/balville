require 'spec_helper'

describe Newevent do

  def reset_newevent(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @newevent.destroy! if @newevent
    @newevent = Newevent.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_newevent
  end

  context "validations" do
    
    it "rejects empty title" do
      Newevent.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_newevent
      Newevent.new(@valid_attributes).should_not be_valid
    end
    
  end

end