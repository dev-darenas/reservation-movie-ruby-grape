require 'yaml'
require "erb"

db_config = YAML.load(ERB.new(File.read('config/database.yml')).result)
Sequel.connect(db_config['development'])
