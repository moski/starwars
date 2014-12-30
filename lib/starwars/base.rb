require 'roar/json'
require 'roar/client'
require 'roar/coercion'
require 'starwars/overrides/ostruct'
require 'virtus'

module Starwars
  #
  # Base Class for fetching all the data from the remote api.
  # All Classes should inhert from this class.
  #
  # Abstract base class for the different resources.
  # Provides some helper methods for the resources.
  #
  # @abstract
  class Base < OpenStruct
    include Roar::JSON
    include Roar::Client
    include Roar::Coercion

    BASE_URL = 'http://swapi.co/api'
    FORMAT = 'application/json'

    #
    # Class level methods for resources to fetch data from api
    # @abstract
    class << self
      #
      # Fetch an object by id or URL
      # @param [String, Integer] param String for full resouce url or the resouce id
      # @return [Person, Film, Planet, Specie, Starship, Vehicle]
      # @example Fetch person by id
      #   Starwars::Person.fetch(1)
      #
      # @example Fetch person by url
      #   Starwars::Person.fetch("http://swapi.co/api/people/2/")
      # @api public
      def fetch(param)
        object = new(url: link(param))
        Starwars::Request.new(object.request_attributes).perform_request
      end

      #
      # Fetch all resource data page by page
      # @return [People, Films, Planets, Species, Starships, Vehicles]
      # @example Fetch Planets page by page
      #   Starwars::Planet.fetch_all.each do |page|
      #     puts page.items.size
      #   end
      # @api public
      def fetch_all
        klass_name =  Starwars.const_get(name.split('::').last).const_get('RESOURCE_NAME')
        object = Starwars.const_get("#{klass_name.capitalize}").new(url: "#{Starwars::Base::BASE_URL}/#{klass_name}/")
        Starwars::Request.new(resource: object, uri: object.url, params: {}).perform_request
      end

      protected

      #
      # Generate a resource link based on the passed params
      # @param [String, Integer] param String for full resouce url or the resouce id
      # @return [String] resouce link
      # @api private
      def link(param)
        if param.is_a? String
          param
        else
          "#{Starwars::Base::BASE_URL}/#{const_get('RESOURCE_NAME')}/#{param}/"
        end
      end
    end

    # The time the resource was created
    # @return [Time]
    # @example
    #   film.created
    # @api public
    property :created, type: Time

    # The time the resource was edited
    # @return [Time]
    # @example
    #   film.edited
    # @api public
    property :edited, type: Time

    # The resource unique id
    # @return [Integer]
    # @example
    #   film.id #=> 1
    # @api public
    property :id, type: Integer

    # The hypermedia URL of this resource
    # @return [String]
    # @example
    #   film.url #=> 'http://swapi.co/api/films/1/'
    # @api public
    property :url

    #
    # Overide the == method for any resource to check the ID and URL
    # @param  [People, Films, Planets, Species, Starships, Vehicles] other
    # @return [Boolean]
    # @example If id's and urls are equal
    #   Starwars::Planet.new(id: 1, url: "/some") == Starwars::Planet.new(id: 1, url: "/some") #=> true
    # @example If id's and urls are equal
    #   Starwars::Planet.new(id: 2, url: "/some") == Starwars::Planet.new(id: 1, url: "/some") #=> false
    # @example If id's and urls are equal
    #   Starwars::Planet.new(id: 1, url: "/some1") == Starwars::Planet.new(id: 1, url: "/some") #=> false
    # @api public
    def ==(other)
      id == other.id && url == other.url
    end

    #
    # Fetch a resource if the ID or URL is set
    # @return [Person, Film, Planet, Specie, Starship, Vehicle]
    # @example Fetch person by id
    #   Starwars::Person.new(id: 1).fetch
    #
    # @example Fetch person by url
    #   Starwars::Person.new(url: "http://swapi.co/api/people/2/").fetch
    # @api public
    def fetch
      Starwars::Request.new(request_attributes).perform_request
    end

    #
    # Generate the Request initialize params
    # @param [Hash] opts the options to create a Request with.
    # @option opts [Person, Film, Planet, Specie, Starship, Vehicle] :resource
    # @option opts [String] :uri resource uri
    # @option opts [Hash] :params other params
    # @return [Hash]
    # @api private
    def request_attributes(opts = {})
      { resource: self, uri: link, params: {} }.merge(opts)
    end

    protected

    #
    # Generate a resource link from the URL or id
    # @return [String] resource link
    # @raise [Starwars::Error::ArgumentError] if no id or url
    # @api private
    def link
      if url
        url
      elsif id
        "#{Starwars::Base::BASE_URL}/#{self.class::RESOURCE_NAME}/#{id}/"
      else
        fail(Starwars::Error::ArgumentError.new('Please use id or url to fetch resouce', nil))
      end
    end
  end
end
