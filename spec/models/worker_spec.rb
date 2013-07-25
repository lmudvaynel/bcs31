require 'spec_helper'

describe Worker do
  before(:each) do
    @worker = FactoryGirl.build :worker
  end

  describe 'check valid' do
    it 'should be valid with valid attributes' do
      @worker.should be_valid
    end

    it 'should be valid with empty photo' do
      @worker.remove_photo!
      @worker.photo = nil
      @worker.should be_valid
      @worker.remove_photo!
      @worker.photo = ''
      @worker.should be_valid
    end
  end

  describe '#full name' do
    it 'should not be empty' do
      @worker.first_name = ''
      @worker.last_name = ''
      @worker.patronymic = ''
      @worker.should be_invalid
    end
  end
end
