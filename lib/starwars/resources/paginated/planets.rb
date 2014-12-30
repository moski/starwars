module Starwars
  #
  # A Planet resource is a large mass, planet or planetoid in
  # the Star Wars Universe, at the time of 0 ABY.
  #
  class Planets < Starwars::Cursor
    collection :results, class: Starwars::Planet,  deserialize: ->(_, fragment, _) { Planet.new(fragment) }
  end
end
