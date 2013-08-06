# encoding: utf-8
ActiveAdmin.register Review do
  menu priority: 6
  config.batch_actions = false

  index do
    column :name do |review|
      review.name
    end
    column :company_name
    column :city
    column :moderated do |review|
      review.moderated? ? "Да" : "Нет"
    end
    column :created_at
    default_actions
  end
end
