# encoding: utf-8

ActiveAdmin.register Worker do

    index do
      column :id
      column :first_name
      column :last_name
      column :photo do |worker|
        image_tag worker.photo.thumb
      end
    column :created_at
    column :updated_at
    default_actions
  end

  show do
    attributes_table :id, :created_at, :updated_at

    panel 'Логотип' do
      image_tag worker.photo.thumb
    end
  end

  form partial: 'form'

end