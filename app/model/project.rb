class Project < ActiveRecord::Base
    belongs_to :user
    belongs_to :developer

    validates_presence_of :name, :developer, :proj_type, :description

    @@types = ["Hotels/Hospitality", "Industrial", "Mixed-Use", "Multi-Family", "Office", "Retail", "Single-Family", "Special Purpose", "Other"]

    def self.types
        @@types
    end

end
