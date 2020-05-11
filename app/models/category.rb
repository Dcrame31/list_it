class Category < ActiveRecord::Base
    has_many :lists
    has_many :lists, through: :list_categories
    has_many :list_categories
end