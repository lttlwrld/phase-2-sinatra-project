class Project < ActiveRecord::Base
    belongs_to :user
    belongs_to :developer

    validates_presence_of :name, :developer, :proj_type, :description

    @@types = ["Commercial", "Single-Family", "Multi-Family", "Mixed-Use", "Other"]

    def self.types
        @@types
    end

end
