#coding: utf-8
Page.reset_column_information
{ index:    'Главная',
  reviews:  'Книга отзывов и предложений',
  contacts: 'Контакты',
  }.each do |slug, name|
  page = FactoryGirl.create(:page, slug: slug)
  page.translations.find_by_locale(:ru).update_attribute :name, name
end
