module Starwars
  #
  # Common Module for the fetcher behaviour across all api references
  #
  module Fetcher
    def self.included(base)
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end

    # Fetcher Methods to be included in every resource
    module InstanceMethods
      #
      # Fetch a resouce give the resource name
      #
      def fetch
        super(resouces_name)
      end

      private

      def resouces_name
        resource = self.class.name.split('::').last.downcase
        (resource == 'person') ? 'people' : "#{resource}s"
      end
    end

    # Fetcher Class Method to be included in every resource
    module ClassMethods
      def fetch(id)
        super(resouces_name, id)
      end

      def resouces_name
        resource = name.split('::').last.downcase
        (resource == 'person') ? 'people' : "#{resource}s"
      end
    end
  end
end
