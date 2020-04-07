class User < ActiveRecord::Base
        has_many :cameras 
        has_many :lenses, through: :cameras

        validates :username, presence: true, uniqueness: true 
        has_secure_password 
end 