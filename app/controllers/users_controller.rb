class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect "/#{current_user.slug}"
        else
            erb :"users/signup"
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == "" || params[:name] == ""
            redirect to '/signup'
        else
            @user = User.create(params)
            if @user.id == nil
                redirect to '/signup'
            else
                session[:user_id] = @user[:id]
                redirect "/#{current_user.slug}"
            end
        end
    end

    get '/login' do
        if logged_in?
            redirect "/#{current_user.slug}"
        else
            erb :"users/login"
        end
    end

    post '/login' do
        user = user = User.find_by(username: params[:username])
        if user != nil
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect "/#{current_user.slug}"
            else
                redirect to '/login'
            end
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
        else
            redirect '/'
        end
    end
    
    get '/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

end
