module Starwars
  #
  # A Vehicle resource is a single transport craft that does not have hyperdrive capability.
  #
  class Vehicle < Starwars::Base
    #
    # Define the source name in the starwars api
    #
    RESOURCE_NAME = 'vehicles'

    # The name of this vehicle
    #
    # @return [String]
    #
    # @note The common name, such as "Sand Crawler" or "Speeder bike"
    #
    # @example
    #   vehicle.name #=> 'Snowspeeder'
    # @api public
    property :name

    # The model or official name of this vehicle
    # @return [String]
    # @example
    #   vehicle.model #=> 't-47 airspeeder'
    # @api public
    property :model

    # The manufacturer of this vehicle. Comma-seperated if more than one
    # @return [String]
    # @example
    #   vehicle.manufacturer #=> 'Incom corporation'
    # @api public
    property :manufacturer

    # consumables
    # @return [String]
    # @example
    #   vehicle.consumables
    # @api public
    property :consumables

    # The class of this vehicle, such as "Wheeled" or "Repulsorcraft"
    # @return [String]
    # @example
    #   vehicle.vehicle_class #=> 'airspeeder'
    # @api public
    property :vehicle_class

    # The cost of this vehicle new, in Galactic Credits
    # @return [String]
    # @example
    #   vehicle.cost_in_credits
    # @api public
    property :cost_in_credits

    # The maximum speed of this vehicle in atmosphere
    # @return [Integer]
    # @example
    #   vehicle.max_atmosphering_speed
    # @api public
    property :max_atmosphering_speed, type: Integer

    # The number of personnel needed to run or pilot this vehicle
    # @return [Integer]
    # @example
    #   vehicle.crew
    # @api public
    property :crew, type: Integer

    # The number of non-essential people this vehicle can transport
    # @return [Integer]
    # @example
    #   vehicle.passengers
    # @api public
    property :passengers, type: Integer

    # The maximum number of kilograms that this vehicle can transport
    # @return [Integer]
    # @example
    #   vehicle.cargo_capacity
    # @api public
    property :cargo_capacity, type: Integer

    # The length of this vehicle in meters
    # @return [Float]
    # @example
    #   vehicle.length
    # @api public
    property :length, type: Float

    # List of pilots
    # @return [Array<Pilot>]
    # @example
    #   vehicle.pilots
    # @api public
    collection :pilots, class: Starwars::Person,  deserialize: ->(_, fragment, _) { Person.new(url: fragment) }

    # List of films
    # @return [Array<Film>]
    # @example
    #   vehicle.films
    # @api public
    collection :films, class: Starwars::Film,  deserialize: ->(_, fragment, _) { Film.new(url: fragment) }
  end
end
