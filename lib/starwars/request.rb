require 'starwars/error'

module Starwars
  # Wrap request attrs
  class Request
    BASE_URL = 'http://swapi.co/api'
    FORMAT = 'application/json'

    # The format of the HTTP request
    # @return [String]
    # @api private
    attr_accessor :as

    # The http method for the request
    # @return [Symbol]
    # @api private
    attr_accessor :method

    # The resouce object that we going to call to fetch the data
    # @return [Person, Film, Planet, Specie, Starship, Vehicle]
    # @api private
    attr_accessor :resource

    # The remote url for the resource that we want to fetch
    # @return [String]
    # @api private
    attr_accessor :uri

    # Extra params we want to send with the http request
    # @return [Hash]
    # @api private
    attr_accessor :params

    # Initializer
    # @param [Hash] attrs request attributes
    # @option attrs [Starwars::] :resource
    # @option attrs [Symbol] :method
    # @option attrs [String] :uri
    # @option attrs [Hash] :params
    # @option attrs [String] :as
    # @return [Starwars::Request]
    # @example
    #   data = Request.new(resource: Person.new(id: 1), uri: "/something")
    # @api public
    def initialize(attrs)
      self.resource = attrs.fetch(:resource)
      self.method = attrs.fetch(:method) { :get }
      self.uri = attrs.fetch(:uri)
      self.as = attrs.fetch(:as) { FORMAT }
      self.params = attrs.fetch(:params) { {} }
    end

    #
    # Delegate to the Roar client to fetch data from api
    # @return [Person, Film, Planet, Specie, Starship, Vehicle]
    # @example
    #   request.perform_request
    # @raise [Starwars::Error]
    # @api public
    def perform_request
      resource.send(method, uri: uri, as: as)

      rescue Roar::Transport::Error => e
        raise_http_errors(e.response.code.to_i, e.response.msg)
    end

    private

    #
    # Check the response code and raise exceptions if needed
    # @param status [Integer]
    # @param message [String]
    # @return [void]
    # @api private
    def raise_http_errors(status, message)
      error_class = Starwars::Error.errors[status]
      fail(error_class.new(message, status)) if error_class
    end
  end
end
