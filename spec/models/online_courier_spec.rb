require 'spec_helper'

describe OnlineCourier do
  let(:online_courier){ FactoryGirl.build(:online_courier) }

  it "should be valid with valid attributes" do
    online_courier.should be_valid
  end

  describe "#date" do
    it "should not be empty" do
      online_courier.date = nil
      online_courier.should be_invalid
    end
  end

  describe "#time_start and #time_end" do
    it "should be valid with empty end time of interval" do
      online_courier.time_start = "12.20"
      online_courier.time_end = nil

      online_courier.should be_valid
    end

    it "should be invalid with too long time" do
      online_courier.time_start = 123456
      online_courier.time_end = 9876432

      online_courier.should be_invalid
    end

    it "should be invalid with empty start time of interval" do
      online_courier.time_start = nil
      online_courier.should be_invalid
    end
  end

  describe "#address" do
    it "should not be empty" do
      online_courier.address = nil
      online_courier.should be_invalid
    end
  end

  describe "#amount" do
    it "should not be empty" do
      online_courier.amount = nil
      online_courier.should be_invalid
    end
  end

  describe "#cargo_type" do
    it "should not be empty" do
      online_courier.cargo_type = nil
      online_courier.should be_invalid
    end
  end

  describe "#city" do
    it "should not be empty" do
      online_courier.city = nil
      online_courier.should be_invalid
    end
  end

  describe "#full_name" do
    it "should not be empty" do
      online_courier.full_name = nil
      online_courier.should be_invalid
    end
  end

  describe "#payer" do
    it "should not be empty" do
      online_courier.payer = nil
      online_courier.should be_invalid
    end
  end

  describe "#payment" do
    it "should not be empty" do
      online_courier.payment = nil
      online_courier.should be_invalid
    end
  end

  describe "#phone" do
    it "should not be empty" do
      online_courier.phone = nil
      online_courier.should be_invalid
    end
  end

  describe "#transportation" do
    it "should not be empty" do
      online_courier.transportation = nil
      online_courier.should be_invalid
    end
  end

  describe "#weight" do
    it "should not be empty" do
      online_courier.weight = nil
      online_courier.should be_invalid
    end
  end
end