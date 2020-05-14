class ListCategory < ActiveRecord::Base
    belongs_to :list
    belongs_to :category
    include Slugify::InstanceMethods
    extend Slugify::ClassMethods
end