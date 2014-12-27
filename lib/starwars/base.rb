require 'roar/json'
require 'roar/client'
require 'roar/coercion'
require 'ostruct'
require 'virtus'
require 'starwars/error'

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

    #
    # A helper class method to simplify the syntax.
    # It gives the user the ability to call class methods instead of newing an object then
    # calling fetch.
    # @example: Starwars::Person.fetch(1)
    #
    class << self
      # Fetch Resouce from swapi.co
      # @param resource_name [String]
      # @param id [Integer]
      # @return [Starwars::Planet|Starwars::Film|Starwars::Person|Starwars::Specie|Starwars::Starship|Starwars::Vehicle]
      def fetch(resource_name, id)
        #
        # Special case for person and people, instead of removing the s
        #
        if (resource_name == 'people')
          klass_name = 'person'
        else
          klass_name = resource_name.chop
        end
        Starwars.const_get(klass_name.capitalize).new(id: id).fetch
      end
    end

    # Overide the == method for any resource to check the ID and URL
    # @param other [Starwars::Planet|Starwars::Film|Starwars::Person|Starwars::Specie|Starwars::Starship|Starwars::Vehicle]
    # @return [Boolean]
    def ==(other)
      id == other.id && url == other.url
    end

    # Fetch Resouce from swapi.co
    # @param resource_name [String]
    # @return [Starwars::Planet|Starwars::Film|Starwars::Person|Starwars::Specie|Starwars::Starship|Starwars::Vehicle]
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
        fail Starwars::Error::ArgumentError.new('You need to pass an id or url to the object', nil)
      end

      rescue Roar::Transport::Error => e
        raise_http_errors(e.response.code.to_i, e.response.msg)
    end
    #
    # Check the response code and raise exceptions if needed
    # @param status [Integer]
    # @param message [String]
    # @return [void]
    def raise_http_errors(status, message)
      error_class = Starwars::Error.errors[status]
      fail(error_class.new(message, status)) if error_class
    end
  end
end
