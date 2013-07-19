require 'spec_helper'

describe Review do
  let(:review) { FactoryGirl.build(:review) }

  it 'should be valid with valid attributes' do
    review.should be_valid
  end

  describe '#first_name' do
    it 'should not be empty'
  end

  describe '#content' do
    it 'should not be empty'
  end
end
