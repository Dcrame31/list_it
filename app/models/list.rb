class List < ActiveRecord::Base
    belongs_to :user
    has_many :list_categories
    has_many :categories, through: :list_categories
end