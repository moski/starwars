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
      # Fetch the resource from the remote URL and serialize it.
      # It will delgate to the super function defined in base.rb
      #
      # @return [Starwars::Planet|Starwars::Film|Starwars::Person|Starwars::Specie|Starwars::Starship|Starwars::Vehicle]
      #
      def fetch
        super(resouces_name)
      end

      private

      #
      # Return the resource name based on the including class.
      #
      # @return [String] the plural name of the resource.
      #
      def resouces_name
        self.class::RESOURCE_NAME
      end
    end

    # Fetcher Class Method to be included in every resource
    module ClassMethods
      #
      # Fetch the resource from the remote URL and serialize it.
      # It will delgate to the super function defined in base.rb
      # @param id [Integer] the resource id
      #
      # @return [Starwars::Planet|Starwars::Film|Starwars::Person|Starwars::Specie|Starwars::Starship|Starwars::Vehicle]
      #
      def fetch(id)
        super(resouces_name, id)
      end

      #
      # Return the resource name based on the including class.
      #
      # @return [String] the plural name of the resource.
      #
      def resouces_name
        const_get('RESOURCE_NAME')
      end
    end
  end
end
