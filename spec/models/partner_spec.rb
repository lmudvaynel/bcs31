require 'spec_helper'

describe Partner do
  before(:each) do
    @partner = FactoryGirl.build :partner
  end

  describe "check valid" do
    it 'should be valid with valid attributes' do
      @partner.should be_valid
    end

    it "should be valid with empty url" do
      @partner.url = ''
      @partner.should be_valid
      @partner.url = nil
      @partner.should be_valid
    end

    it "should be invalid with empty logo" do
      @partner.remove_logo!
      @partner.logo = nil
      @partner.should be_invalid
      @partner.remove_logo!
      @partner.logo = ''
      @partner.should be_invalid
    end
  end
end