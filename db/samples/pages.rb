#coding: utf-8
Page.reset_column_information
{ index:    'Главная',
  about:    'О компании',
  reviews:  'Книга отзывов и предложений',
  contacts: 'Контакты',
  }.each do |slug, name|
  page = FactoryGirl.create(:page, slug: slug)
  page.translations.find_by_locale(:ru).update_attribute :name, name
end

services = FactoryGirl.create(:page, slug: 'services')
services.translations.find_by_locale(:ru).update_attribute :name, 'Услуги'

{ order:    'Заказ (забор из другого города)',
  express:  'Экспресс доставка',
  assembled: 'Сборные грузы',
  commander: 'Командирская почта',
  tariffs: 'Тарифы' }.each do |slug, name|
  page = FactoryGirl.create(:page, slug: slug)
  page.parent = services
  page.translations.find_by_locale(:ru).update_attribute :name, name
  page.save!

end