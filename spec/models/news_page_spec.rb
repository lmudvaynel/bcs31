require 'spec_helper'

describe NewsPage do
  
  let(:news_page) { FactoryGirl.build(:news_page) }

  it 'should be valid with valid attributes' do
    news_page.should be_valid
  end

  describe '#title' do
    it 'should not be empty' do
      news_page.title = ' '
      news_page.should be_invalid
    end
  end

  describe '#content' do
    it 'should not be empty' do
      news_page.content = ' '
      news_page.should be_invalid
    end
  end
  
end
