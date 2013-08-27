# encoding: utf-8
ActiveAdmin.register NewsPage do
  menu priority: 4
  config.batch_actions = false

  sortable

  index do
    column :image do |news|
      image_tag news.image.thumb.url
    end
    column :title
    column :description
    column :created_at
    column :published_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :content, as: :ckeditor
      f.input :image
      f.input :published_at
    end
    f.actions
  end
end
