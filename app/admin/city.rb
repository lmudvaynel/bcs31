# encoding: utf-8
ActiveAdmin.register City do
 menu parent: 'Расчет суммы'
 config.sort_order = 'name_asc'
  index do
    column :name

    default_actions
  end
end
