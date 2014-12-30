module Starwars
  # Custom error class for rescuing from all Starwars errors
  class Error < StandardError
    class << self
      # Return a hash of error classes
      # @return [Hash]
      # @example get the total number of pages
      #   Starwars::Error.errors
      # @api public
      def errors
        @errors ||=  {
          400 => Starwars::Error::BadRequest,
          401 => Starwars::Error::Unauthorized,
          403 => Starwars::Error::Forbidden,
          404 => Starwars::Error::NotFound,
          500 => Starwars::Error::InternalServerError,
          503 => Starwars::Error::ServiceUnavailableError
        }
      end
    end

    # Initializes a new Error object
    #
    # @param message [Exception, String]
    # @param _status [Exception, status]
    # @return [Starwars::Error]
    # @example
    #   Starwars::Error.new('I am your father', nil)
    # @api public
    def initialize(message = '', _status = nil)
      super(message)
    end

    class ArgumentError < self; end

    # Raised when Starwars returns a 4xx HTTP status status_code
    class ClientError < self; end

    # Raised when Starwars returns the HTTP status status_code 400
    class BadRequest < ClientError; end

    # Raised when Starwars returns the HTTP status status_code 401
    class Unauthorized < ClientError; end

    # Raised when Starwars returns the HTTP status status_code 403
    class Forbidden < ClientError; end

    # Raised when Starwars returns the HTTP status status_code 404
    class NotFound < ClientError; end

    # Raised when Starwars returns a 5xx HTTP status code
    class ServerError < self; end

    # Raised when Starwars returns the HTTP status status_code 500
    class InternalServerError < ServerError; end

    # Raised when Starwars returns the HTTP status status_code 503
    class ServiceUnavailableError < ServerError; end

    # Raised when the request times out
    class RequestTimeout < self; end
  end
end
