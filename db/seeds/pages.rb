#coding: utf-8

Page.reset_column_information
Page.create!(slug: 'index', position: 1, translations_attributes: [
  { locale: 'ru', name: 'Главная' },
  { locale: 'en', name: 'Main' }
])
Page.create!(slug: 'about', position: 2, translations_attributes: [
  { locale: 'ru', name: 'О компании' },
  { locale: 'en', name: 'About' }
])
Page.create!(slug: 'contacts', position: 5, translations_attributes: [
  { locale: 'ru', name: 'Контакты' },
  { locale: 'en', name: 'Contacts' }
])