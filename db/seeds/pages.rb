#coding: utf-8

Page.reset_column_information
Page.create!(slug: 'index',     position: 1, name: 'Главная')
Page.create!(slug: 'about',     position: 2, name: 'О компании')
Page.create!(slug: 'contacts',  position: 5, name: 'Контакты')
