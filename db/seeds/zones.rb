
data = YAML.load_file(Rails.root.join('db', 'seeds', 'zones', 'bcs.yml'))
Zone.create!(data['zones'])