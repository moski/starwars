require 'roar/json'
require 'roar/client'
require 'roar/coercion'
require 'ostruct'
require 'equalizer'
require 'virtus'

module Starwars
  #
  # Base Class for fetching all the data from the remote api.
  # All Classes should inhert from this class.
  #
  class Base < OpenStruct
    include Roar::JSON
    include Roar::Client
    include Roar::Coercion

    BASE_URL = 'http://swapi.co/api'
    FORMAT = 'application/json'

    def ==(other)
      id == other.id && url == other.url
    end

    def fetch(resource_name)
      #
      # If the url is set, then fetch using the resource url
      #
      if url
        get(uri: url, as: FORMAT)
      #
      # Try to fetch using the resource name and ID
      #
      elsif id
        get(uri: "#{BASE_URL}/#{resource_name}/#{id}/", as: FORMAT)
      else
        fail 'error'
      end
    end
    class << self
      def fetch(resources, id)
        #
        # Special case for person and people, instead of removing the s
        #
        if (resources == 'people')
          resources = 'person'
        else
          resources.slice!(-1, 1)
        end
        Starwars.const_get(resources.capitalize).new(id: id).fetch
      end
    end
  end
end
