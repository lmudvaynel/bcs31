# Encoding: utf-8
require 'spec_helper'

describe Page do

  let(:page) { FactoryGirl.build(:page) }

  it 'should be valid with valid attributes' do
    page.should be_valid
  end

  describe '#content' do
    it 'should be valid html' do
      ['<div> left oak', 'right oak </div>', '<div>center oak</span>'].each do |html|
        page.content = html
        page.should have(1).errors_on(:content)
      end
      page.content = "<div>right oak</div><a href='forest'>oaks forest</a>"
      page.should be_valid
    end
  end

  describe '#name' do
    it 'should not be empty' do
      page.name = ' '
      page.should have(1).errors_on(:name)
    end
  end

  describe '#slug' do
    it 'should be unique' do
      FactoryGirl.create :page, :slug => page.slug
      page.should have(1).errors_on(:slug)
    end

    context 'when slug blank' do
      context 'when page have name' do
        it 'should be filled with transliterated name' do
          page.name = 'Всероссийская ассоциация ежей'
          page.slug = ' '
          page.should be_valid
          page.slug.should == 'vserossiyskaya-assotsiatsiya-ezhey'
        end
      end

      context 'when page have not name' do
        it 'should be invalid' do
          page.name = ' '
          page.slug = ' '
          page.should have(1).errors_on(:slug)
        end
      end
    end

    context 'when slug present' do
      it 'should not be changed after validation' do
        page.slug = 'world-hedgehogs-association'
        page.should be_valid
        page.slug.should == 'world-hedgehogs-association'
      end
    end
  end

end
