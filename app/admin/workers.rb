# encoding: utf-8

ActiveAdmin.register Worker do

    index do
      column :last_name
      column :first_name
      column :patronymic
      column :job
      column :phone
      column :photo do |worker|
        image_tag worker.photo.thumb.url
      end
    default_actions
  end

  show do
    attributes_table :id, :created_at, :updated_at

    panel 'Фото' do
      image_tag worker.photo.thumb.url
    end
  end

  form partial: 'form'

end