class User < ActiveRecord::Base
    has_many :lists
    has_many :categories, through: :lists
end