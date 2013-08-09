
data = YAML.load_file(Rails.root.join('db', 'samples', 'cities', 'cities.yml'))
City.create(data['cities'])