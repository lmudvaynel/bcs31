require 'spec_helper'

describe Region do
  let(:region){ FactoryGirl.build(:region) }

  it 'should be valid with valid attributes' do
    region.should be_valid
  end
end
