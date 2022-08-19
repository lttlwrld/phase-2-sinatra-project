class ProjectsController < ApplicationController

    get '/projects' do
    end

    get '/projects/:id' do
        @project = Project.find(params[:id])
        erb :'projects/show'
    end


end