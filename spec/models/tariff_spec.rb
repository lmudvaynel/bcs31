require 'spec_helper'

describe Tariff do

  let(:tariff){ FactoryGirl.build(:tariff) }

  it 'should be valid with valid attributes' do
    tariff.should be_valid
  end
  
  describe '.with_weight' do
    it 'should return tariffs which intervals (weight_start, weight_end] include weight' do
      tariffs = [
        FactoryGirl.create(:tariff, weight_start: 0, weight_end: 0.5),
        FactoryGirl.create(:tariff, weight_start: 0.5, weight_end: 1),
        FactoryGirl.create(:tariff, weight_start: 1, weight_end: 1.5)
      ]
      t = Tariff.with_weight(1)
      t.should include(tariffs[1])
      t.should_not include(tariffs[0])
      t.should_not include(tariffs[2])
    end
  end

  describe '#cargo_kind' do
    it 'should not be empty' do
      tariff.cargo_kind = nil
      tariff.should have(1).errors_on(:cargo_kind)
    end
  end

end
