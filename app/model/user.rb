class User < ActiveRecord::Base
    has_many :projects
    has_many :developers, through: :projects
    has_secure_password

    validates :username, uniqueness: true
    validates :email, uniqueness: true

    def slug
        self.username.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        self.all.find{|user| user.slug == slug}
    end
    
end
