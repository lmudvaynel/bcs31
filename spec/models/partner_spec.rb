require 'spec_helper'

describe Partner do
  let(:partner){ FactoryGirl.build(:partner) }

  it 'should be valid with valid attributes' do
    partner.should be_valid
  end
end
