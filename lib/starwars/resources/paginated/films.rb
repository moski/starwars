module Starwars
  #
  # Films container
  #
  class Films < Starwars::Cursor
    collection :results, class: Starwars::Film,  deserialize: ->(_, fragment, _) { Film.new(fragment) }
  end
end
