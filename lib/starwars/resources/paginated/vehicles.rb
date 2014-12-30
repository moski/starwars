module Starwars
  #
  # Starships Container
  #
  class Vehicles < Starwars::Cursor
    collection :results, class: Starwars::Vehicle,  deserialize: ->(_, fragment, _) { Vehicle.new(fragment) }
  end
end
