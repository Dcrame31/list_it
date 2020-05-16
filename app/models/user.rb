class User < ActiveRecord::Base
    has_secure_password
    has_many :lists
    has_many :categories, through: :lists
    validates_uniqueness_of :username
end