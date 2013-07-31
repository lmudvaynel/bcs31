# encoding: utf-8

ActiveAdmin.register Worker do

    index do
      column :name do |worker|
        worker.name
      end
      column :patronymic
      column :job
      column :phone

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