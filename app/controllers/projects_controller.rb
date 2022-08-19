class ProjectsController < ApplicationController

    get '/projects/new' do
        if logged_in?
            erb :"projects/new"
        else
            redirect '/login'
        end
    end

    post '/projects/new' do
        if logged_in?
            if params[""] != ""
                @project = Project.create(user_id: current_user.id)
                redirect "/projects/#{@project.id}"
            else
                redirect '/projects/new'
            end
        else
            redirect '/login'
        end
    end

    get '/projects/:id' do
        @project = Project.find(params[:id])
        erb :'projects/show'
    end


end