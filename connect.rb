# connect to PSQL with authentication
ActiveRecord::Base.configurations=(
  YAML.load(File.read('db/config.yml'))
)
ActiveRecord::Base.establish_connection(:development)
