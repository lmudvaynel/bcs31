require 'spec_helper'

describe City do
  let(:city){ FactoryGirl.build(:city) }

  it 'should be valid with valid attributes' do
    city.should be_valid
  end

  describe '#name' do
    it 'should not be empty' do
      city.name = ' '
      city.should have(1).errors_on(:name)
    end

    it 'should be unique' do
      city.save
      dup = FactoryGirl.build(:city)
      dup.name = city.name
      dup.should have(1).errors_on(:name)
    end
  end

  describe '#provider_for' do
    context 'when pay not in belgorod or delivery not from belgorod' do
      it 'should return major express' do
        city.provider_for(false).should == :major_express
        city.provider_for(true).should == :major_express
        city.affiliate = true
        city.provider_for(false).should == :major_express
      end
    end

    context 'when pay in belgorod and delivery from belogorod' do
      it 'should return bcs' do
        city.affiliate = true
        city.provider_for(true).should == :bcs
      end
    end
  end

  describe '#zone_to' do
    it 'should return zone for delivery from current city to other city' do
      city_from = FactoryGirl.create(:city)
      city_to = FactoryGirl.create(:city)
      bcs_zone = FactoryGirl.build(:bcs_zone)
      major_express_zone = FactoryGirl.build(:major_express_zone)
      FactoryGirl.create(:delivery_city_relation,
                         city_from: city_from, city_to: city_to,
                         zones: [bcs_zone, major_express_zone])
      city_from.zone_to(city_to, false).should == major_express_zone
      city_from.zone_to(city_to, true).should == major_express_zone
      city_from.affiliate = true #delivery from belgorod
      city_from.zone_to(city_to, false).should == major_express_zone
      city_from.zone_to(city_to, true).should == bcs_zone
    end
  end

  describe '#delivery_price_to' do
    it 'should calculate delivery price from current city to other city'
  end
end
