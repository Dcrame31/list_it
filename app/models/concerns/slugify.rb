module Slugify
    module InstanceMethods
        def slug
            self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, "")
        end
    end

    module ClassMethods

        def find_by_slug(slug)
            self.all.detect {|name| name.slug == slug}
        end


    end
end