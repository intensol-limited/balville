require 'spec_helper'

describe Newsblog do

  def reset_newsblog(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @newsblog.destroy! if @newsblog
    @newsblog = Newsblog.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_newsblog
  end

  context "validations" do
    
    it "rejects empty title" do
      Newsblog.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_newsblog
      Newsblog.new(@valid_attributes).should_not be_valid
    end
    
  end

end