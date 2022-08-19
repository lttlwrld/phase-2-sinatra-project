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
            @project = Project.create(name: params["name"], proj_type: params["proj_type"], description: params["description"], user_id: current_user.id) 
            if params["new_developer"] == ""
                @project.developer = Developer.find_by(name: params[:developer])
            else
                @project.developer = Developer.find_or_create_by(name: params["new_developer"])
            end
            @project.save
            if @project.id == nil
                redirect '/projects/new'
            else
                redirect "/projects/#{@project.id}"
            end
        end
        redirect '/login'
    end

    get '/projects/:id' do
        @project = Project.find(params[:id])
        erb :'projects/show'
    end

    get '/projects/:id/edit' do
        @project = Project.find(params[:id])
        if current_user.id == @project.user.id
            erb :'projects/edit'
        else
            redirect '/login'
        end
    end

    patch '/projects/:id/edit' do
        @project = Project.find(params[:id])
        if current_user.id == @project.user.id
            if params["new_developer"] == ""
                @project.developer = Developer.find_by(name: params[:developer])
            else
                @project.developer = Developer.find_or_create_by(name: params["new_developer"])
            end
            if !@project.save
                redirect "/projects/#{@project.id}/edit"
            else
                @project.update(name: params["name"], proj_type: params["proj_type"], description: params["description"], user_id: current_user.id) 
                redirect "/projects/#{@project.id}"
            end
        end
        redirect '/login'
    end

    delete '/projects/:id/delete' do
        @project = Project.find(params[:id])
        if current_user = @project.user
            @project.delete
            redirect "/#{@project.user.slug}"
        else
            redirect '/login'
        end
    end

end