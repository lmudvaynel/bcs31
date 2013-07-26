require 'spec_helper'

describe Banner do
  let(:banner){ FactoryGirl.build(:banner) }

  it 'should be valid with valid attributes' do
    banner.should be_valid
  end

  describe '#content' do
    it 'should not be empty' do
      banner.content = ' '
      banner.should be_invalid
    end
  end

  describe '#paragraph' do
    it "should return required line of content" do
      banner.content = "hedgehog\n\nate\nelephant"
      banner.paragraph(0).should == 'hedgehog'
      banner.paragraph(1).should == 'ate'
      banner.paragraph(2).should == 'elephant'
    end
  end
end
