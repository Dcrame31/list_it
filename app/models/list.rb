class List < ActiveRecord::Base
    belongs_to :user
    has_many :categories
    has_many :categories, through: :list_categories
    include Slugify::InstanceMethods
    extend Slugify::ClassMethods
end