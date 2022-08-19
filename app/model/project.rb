class Project < ActiveRecord::Base
    belongs_to :user
    belongs_to :developer

    @@types = ["Commercial", "Single-Family", "Multi-Family", "Mixed-Use", "Other"]

    def self.types
        @@types
    end

end
