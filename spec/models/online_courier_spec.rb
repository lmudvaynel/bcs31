require 'spec_helper'

describe OnlineCourier do
  let(:online_courier){ FactoryGirl.build(:online_courier) }

  describe "check valid" do
    it "should be valid with valid attributes" do
      online_courier.should be_valid
    end
  end

  describe "check date" do
    it "should be valid" do
      online_courier.date = Date.tomorrow
      online_courier.should be_valid
    end
  end

  describe "validation of legth time" do
    it "should be invalid" do
      online_courier.start_time = 123456
      online_courier.end_time = 9876432

      online_courier.should be_invalid
    end
  end
end