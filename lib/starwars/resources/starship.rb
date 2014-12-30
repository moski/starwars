module Starwars
  #
  # A Starship resource is a single transport craft that has hyperdrive capability.
  #
  class Starship < Starwars::Base
    #
    # Define the source name in the starwars api
    #
    RESOURCE_NAME = 'starships'

    # The name of this starship
    #
    # @return [String]
    #
    # @note The common name, such as "Death Star".
    #
    # @example
    #   starship.name #=> 'Death Star'
    # @api public
    property :name

    # The model or official name of this starship
    # @return [String]
    #
    # @example
    #   starship.model #=> 'DS-1 Orbital Battle Station'
    # @api public
    property :model

    # The manufacturer of the starship
    # @return [String]
    # @example
    #   starship.manufacturer #=> 'Imperial Department of Military Research'
    # @api public
    property :manufacturer

    # The class of this starship
    # @return [String]
    # @example
    #   starship.starship_class #=> 'Starfighter'
    # @api public
    property :starship_class

    # consumables
    # @return [String]
    # @example
    #   starship.consumables
    # @api public
    property :consumables

    # The cost of this new starship, in Galactic Credits
    # @return [String]
    # @example
    #   starship.cost_in_credits
    # @api public
    property :cost_in_credits, type: Integer

    # The length of this starship in meters
    # @return [String]
    # @example
    #   starship.length
    # @api public
    property :length, type: Integer

    # The maximum speed of this starship in atmosphere
    # @return [Integer]
    # @example
    #   starship.max_atmosphering_speed
    # @api public
    property :max_atmosphering_speed, type: Integer

    # The number of personnel needed to run or pilot this starship
    # @return [Integer]
    # @example
    #   starship.crew
    # @api public
    property :crew, type: Integer

    # The number of non-essential people this starship can transport
    # @return [Integer]
    # @example
    #   starship.passengers
    # @api public
    property :passengers, type: Integer

    # The maximum number of kilograms that this starship can transport
    # @return [Integer]
    # @example
    #   starship.cargo_capacity
    # @api public
    property :cargo_capacity, type: Integer
    # property :MGLT, as: :mglt

    # The class of this starships hyperdrive
    # @return [Float]
    # @example
    #   starship.hyperdrive_rating
    # @api public
    property :hyperdrive_rating, type: Float

    # List of pilots
    # @return [Array<Pilot>]
    # @example
    #   starship.pilots
    # @api public
    collection :pilots, class: Starwars::Person,  deserialize: ->(_, fragment, _) { Person.new(url: fragment) }

    # List of films
    # @return [Array<Film>]
    # @example
    #   starship.films
    # @api public
    collection :films, class: Starwars::Film,  deserialize: ->(_, fragment, _) { Film.new(url: fragment) }
  end
end
