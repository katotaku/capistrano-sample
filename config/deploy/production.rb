set :rails_env, 'production'

role :web, "localhost"
role :app, "localhost"
role :db,  "localhost", :primary => true

set :deploy_to, '/var/www/capistrano_sample/production/' 
