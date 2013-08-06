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

    it "should be invalid" do
      online_courier.date = nil
      online_courier.should be_invalid
    end
  end

  describe "validation of length time" do
    it "should be valid with empty end time of interval" do
      online_courier.time_start = "12.20"
      online_courier.time_end = nil

      online_courier.should be_valid
    end

    it "should be invalid" do
      online_courier.time_start = 123456
      online_courier.time_end = 9876432

      online_courier.should be_invalid
    end

    it "should be invalid with empty start time of interval" do
      online_courier.time_start = nil
      online_courier.should be_invalid
    end
  end
end