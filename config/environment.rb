require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(:default_env)

require_all 'app'