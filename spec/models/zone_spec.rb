require 'spec_helper'

describe Zone do
  let(:zone){ FactoryGirl.build(:zone) }

  it 'should be valid with valid attributes' do
    zone.should be_valid
  end

  describe '#name' do
    it 'should not be empty' do
      zone.name = ' '
      zone.should have(1).errors_on(:name)
    end

    it 'should be unique for provider' do
      zone1 = FactoryGirl.create(:bcs_zone)
      zone2 = FactoryGirl.build(:bcs_zone, name: zone1.name)
      zone2.should have(1).errors_on(:name)

      zone3 = FactoryGirl.build(:major_express_zone, name: zone1.name)
      zone3.should be_valid
    end
  end

  describe '#tariff' do
    it 'should return tariff with kind which interval include weight or last of tariffs' do
      tariffs = [
        FactoryGirl.create(:document_tariff, weight_start: 0, weight_end: 0.5),
        FactoryGirl.create(:document_tariff, weight_start: 0.5, weight_end: 1),
        FactoryGirl.create(:document_tariff, weight_start: 1, weight_end: 1.5)
      ]
      z = FactoryGirl.create(:zone, tariffs: tariffs)
      z.tariff(1, :document).should == tariffs[1]
      z.tariff(2, :document).should == tariffs[2]
    end
  end
end
