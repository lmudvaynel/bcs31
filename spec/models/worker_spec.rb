require 'spec_helper'

describe Worker do
  let(:worker) {FactoryGirl.build(:worker)}

  it 'should be valid with valid attributes' do
    worker.should be_valid
  end

  describe 'first name' do
    it 'shoul not be empty'
  end

end
