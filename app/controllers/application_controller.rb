require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :views, 'app/views'
    set :session_secret, "secret_and_secure"
  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end

  get '/' do
    binding.pry
    erb :index
  end

end