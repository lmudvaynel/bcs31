
data = YAML.load_file(Rails.root.join('db', 'seeds', 'cities', 'cities.yml'))
City.create(data['cities'])