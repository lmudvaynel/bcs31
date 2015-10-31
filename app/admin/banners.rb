# encoding: utf-8
ActiveAdmin.register Banner do
  menu parent: 'Контент'

  sortable

  index do
    column :image do |banners|
      if banners.image.thumb.url
        image_tag banners.image.thumb.url
      end
    end
    column :content
    column :url
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :content, as: :ckeditor
      f.input :url
      f.input :image
    end

    f.actions
  end

end
