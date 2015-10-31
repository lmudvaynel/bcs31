# encoding: utf-8
ActiveAdmin.register Iframe do
  menu parent: 'Контент'
  index do
    column :name
    column :url
    column :height
    column :width
    column :top

    default_actions
  end

  form partial: 'form'
end
