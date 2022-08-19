class AddTypeAndDescriptionToProjects < ActiveRecord::Migration[6.0]
    def change
        add_column :projects, :proj_type, :string
        add_column :projects, :description, :string
    end
  end