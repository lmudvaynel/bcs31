#coding: utf-8

Page.reset_column_information
FactoryGirl.create(:page, slug: 'index')
FactoryGirl.create(:page, slug: 'contacts')
FactoryGirl.create(:page, slug: 'online_couriers')