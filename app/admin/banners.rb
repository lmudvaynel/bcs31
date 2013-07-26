ActiveAdmin.register Banner do

  form do |f|
    f.inputs do
      f.input :content, as: :ckeditor
      f.input :url
    end

    f.actions
  end

end
