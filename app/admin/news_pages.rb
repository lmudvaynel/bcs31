# Encoding: utf-8
ActiveAdmin.register NewsPage do
  menu :priority => 6
  config.batch_actions = false

  sortable

  index do
    column :image do |news|
      image_tag news.image.thumb.url
    end
    column :title
    column :description
    column :created_at
    default_actions
  end

  form partial: 'form'
end
