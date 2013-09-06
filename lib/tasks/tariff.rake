namespace :tariffs do
  desc "mass creation of home tariffs"
  task :create, [:yaml_file] =>:environment do |t, args|
    file = args.yaml_file
    file += '.yml' if File.extname(file) != '.yml'
    yaml_file = Rails.root.join("db", "samples", "delivery_city_relations", file)
    relations = YAML::load_file(yaml_file)['delivery_city_relations']
    relations.each do |relation|
      delivery_city_relation = DeliveryCityRelation.new
      delivery_city_relation.city_to = City.find_by_name(relation['city_to'])
      delivery_city_relation.city_from = City.find_by_name(relation['city_from'])
      delivery_city_relation.zones << Zone.find_by_name(relation['zone'])
      delivery_city_relation.delivery_time = relation['delivery_time']
      delivery_city_relation.business_morning = relation['business_morning']
      delivery_city_relation.save!
    end
  end
end