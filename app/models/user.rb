class User < ActiveRecord::Base
    has_secure_password
    has_many :lists
    has_many :categories, through: :lists
    validates :username, :presence => true, :uniqueness => true
    validates :email, presence: true
end