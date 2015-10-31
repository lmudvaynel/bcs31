# encoding: utf-8
ActiveAdmin.register Tariff do
menu parent: 'Расчет суммы'
config.sort_order = 'id_asc'
  index do
   	column "Zone" do |i| 
    	i.zone.name.to_s+" - "+i.zone.provider.to_s
    end
    column :weight_start
    column :weight_end
    column :price_cents
    column :additional_price_cents
    default_actions
  end
  form partial: 'form'
end
