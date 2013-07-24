require 'spec_helper'

describe OnlineCourier do
  before(:each) do
    @online_courier = FactoryGirl.build :online_courier
  end

  describe "check valid" do
    it 'should be valid with valid attributes' do
      @online_courier.should be_valid
    end
  end
end