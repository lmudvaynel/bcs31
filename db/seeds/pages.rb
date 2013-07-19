#coding: utf-8

Page.reset_column_information
Page.create!(slug: 'index', translations_attributes: [
  { locale: 'ru', name: 'Главная' },
  { locale: 'en', name: 'Main' }
])
Page.create!(slug: 'contacts', translations_attributes: [
  { locale: 'ru', name: 'Контакты' },
  { locale: 'en', name: 'Contacts' }
])