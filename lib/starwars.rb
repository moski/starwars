require 'starwars/version'
require 'starwars/base'
require 'starwars/fetcher'

# Avoid circuler require issues :(
module Starwars
  class Planet < Starwars::Base; end
  class Person < Starwars::Base; end
  class Film < Starwars::Base; end
  class Specie < Starwars::Base; end
  class Vehicle < Starwars::Base; end
  class Starship < Starwars::Base; end
end
require 'starwars/planet'
require 'starwars/person'
require 'starwars/specie'
require 'starwars/vehicle'
require 'starwars/starship'
require 'starwars/film'
