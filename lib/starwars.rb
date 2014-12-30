require 'starwars/version'
require 'starwars/base'
require 'starwars/request'
require 'starwars/cursor'

# Avoid circuler require issues :(
module Starwars
  class Planet < Starwars::Base; end
  class Person < Starwars::Base; end
  class Film < Starwars::Base; end
  class Specie < Starwars::Base; end
  class Vehicle < Starwars::Base; end
  class Starship < Starwars::Base; end
end
require 'starwars/resources/planet'
require 'starwars/resources/person'
require 'starwars/resources/specie'
require 'starwars/resources/vehicle'
require 'starwars/resources/starship'
require 'starwars/resources/film'

# Resources with pagination
require 'starwars/resources/paginated/planets'
require 'starwars/resources/paginated/films'
require 'starwars/resources/paginated/people'
require 'starwars/resources/paginated/species'
require 'starwars/resources/paginated/starships'
require 'starwars/resources/paginated/vehicles'
