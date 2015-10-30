# encoding: utf-8
ActiveAdmin.register SocialNetwork do
  config.batch_actions = false
  config.sort_order = 'position_asc'

  sortable

  index do
    sortable_handle_column
    column :position, :sortable => :position
    column :name
    column :url
    column :logo do |partner|
      image_tag partner.logo.url
    end
    column :hidden do |resource|
      resource.hidden? ? 'Да' : 'Нет'
    end
    default_actions
  end

  show do
    attributes_table :id, :name, :url, :created_at, :updated_at

    panel 'Логотип' do
      image_tag social_network.logo.url
    end
  end

  form partial: 'form'

end
