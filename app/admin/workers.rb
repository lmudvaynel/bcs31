# encoding: utf-8
ActiveAdmin.register Worker do
  menu parent: 'Контент'
  config.batch_actions = false
  config.sort_order = 'position_asc'

  sortable

    index do
      sortable_handle_column
      column :position, :sortable => :position
      column :name do |worker|
        worker.name
      end
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
