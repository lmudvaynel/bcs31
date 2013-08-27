ActiveAdmin.register Banner do
  menu priority: 2

  sortable

  index do
    column :image do |banners|
      image_tag banners.image.thumb.url
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
