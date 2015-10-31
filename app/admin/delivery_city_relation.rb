# encoding: utf-8
ActiveAdmin.register DeliveryCityRelation do
 menu parent: 'Расчет суммы'
 index do
    column :city_from
    column :city_to
    column :delivery_time
    column "Зона" do |zone|
      zone.zones.first.name
    end
    column "Провайдер" do |zone|
      zone.zones.first.provider
    end

    default_actions
  end

 form do |f|
   f.inputs "" do 
     f.input :city_from_id, as: :select,
                 collection: Hash[City.all.map{|city| ["#{city.name}", city.id]}]
     f.input :city_to_id, as: :select,
                 collection: Hash[City.all.map{|city| ["#{city.name}", city.id]}]
     f.input :delivery_time
   end

   f.has_many :zone_delivery_relations do |app_f|
     app_f.inputs "" do
       if !app_f.object.nil?
         app_f.input :_destroy, :as => :boolean, :label => "Destroy?"
       end

       app_f.input :zone # it should automatically generate a drop-down select to choose from your existing patients
     end
   end
   f.actions
 end
end