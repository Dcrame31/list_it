class ListCategory < ActiveRecord::Base
    belongs_to :list
    belongs_to :category
end