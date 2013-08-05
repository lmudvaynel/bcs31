#coding: utf-8
Page.reset_column_information
{ index:    'Главная',
  about:    'О компании',
  reviews:  'Книга отзывов и предложений',
  contacts: 'Контакты',
  services: 'Услуги'
  }.each do |slug, name|
  page = FactoryGirl.create(:page, slug: slug, name: name)
end

services = Page.find_by_slug(:services)
{ order:      'Заказ (забор из другого города)',
  express:    'Экспресс доставка',
  assembled:  'Сборные грузы',
  commander:  'Командирская почта',
  tariffs:    'Тарифы' }.each do |slug, name|
  page = FactoryGirl.create(:page, slug: slug, name: name, parent_id: services.id)
end
