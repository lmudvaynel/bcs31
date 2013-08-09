require 'spec_helper'

describe DeliveryCityRelation do
  let(:rel){ FactoryGirl.build(:delivery_city_relation) }

  it 'should be valid with valid attributes' do
    rel.should be_valid
  end
end
