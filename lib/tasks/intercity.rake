namespace :tariffs do
  desc "mass creation of intercity tariffs"
  task :intercity, [:yaml_file] =>:environment do |t, args|
    file = args.yaml_file
    file += '.yml' if File.extname(file) != '.yml'
    yaml_file = Rails.root.join("db", "samples", "delivery_city_relations", file)
    cities = YAML::load_file(yaml_file)['cities']
    destinations = YAML::load_file(yaml_file)['destination']
    destinations.each do |destination|
      i = 0
      puts City.find_by_name(destination['city']).name
      cities.each do |city|
        delivery_city_relation = DeliveryCityRelation.new
        puts destination['zone_attributes'][i]['time']
        delivery_city_relation.city_from = City.find_by_name(city['name'])
        delivery_city_relation.city_to = City.find_by_name(destination['city'])
        delivery_city_relation.zones << Zone.find_by_name(destination['zone_attributes'][i]['zone'])
        delivery_city_relation.delivery_time = destination['zone_attributes'][i]['time']
        i += 1
      end
    end
  end
end