ActiveAdmin.register Iframe do
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
