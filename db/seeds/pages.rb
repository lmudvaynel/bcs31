#coding: utf-8

Page.reset_column_information
FactoryGirl.create(:page, slug: 'index')
FactoryGirl.create(:page, slug: 'contacts')
Page.create!(slug: 'services', name: 'Услуги')