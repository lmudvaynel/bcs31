require 'spec_helper'

describe Review do
  let(:review) { FactoryGirl.build(:review) }

  it 'should be valid with valid attributes' do
    review.should be_valid
  end

  describe '#first_name' do
    it 'should not be empty' do
      review.first_name = ' '
      review.should have(1).errors_on(:first_name)
    end
  end

  describe '#content' do
    it 'should not be empty' do
      review.content = ' '
      review.should have(1).errors_on(:content)
    end
  end

  describe '#moderated' do
    it 'should be false by default' do
      review.should_not be_moderated
    end
  end
end
