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

  describe 'full filled review' do
    let(:review) { FactoryGirl.create(:filled_review) }

    it '#company_name should not be empty, if #logo not empty' do
      review.company_name = ' '
      review.should have(1).errors_on(:company_name)
    end

    it '#logo should not be empty, if #company_name not empty' do
      review.remove_logo!
      review.should have(1).errors_on(:logo)
    end
  end
end
