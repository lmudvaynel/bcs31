
data = YAML.load_file(Rails.root.join('db', 'samples', 'zones', 'bcs.yml'))
Zone.create!(data['zones'])