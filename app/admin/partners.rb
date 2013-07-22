# encoding: utf-8

ActiveAdmin.register Partner do

  index do
    column :url
    column :logo do |partner|
      image_tag partner.logo.thumb.url
    end
    column :created_at
    column :updated_at
    default_actions
  end

  show do
    attributes_table :id, :url, :created_at, :updated_at

    panel 'Логотип' do
      image_tag partner.logo.thumb.url
    end
  end

  form partial: 'form'

end