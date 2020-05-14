class User < ActiveRecord::Base
    has_secure_password
    has_many :lists
    has_many :categories, through: :lists
    include Slugify::InstanceMethods
    extend Slugify::ClassMethods
end