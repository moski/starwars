# Starwars

[![Coverage Status](https://coveralls.io/repos/moski/starwars/badge.png?branch=master)](https://coveralls.io/r/moski/starwars?branch=master)
[![Build Status](https://travis-ci.org/moski/starwars.svg?branch=master)](https://travis-ci.org/moski/starwars)
[![Inline docs](http://inch-ci.org/github/moski/starwars.svg?branch=master&style=flat)](http://inch-ci.org/github/moski/starwars)

A Ruby interface for http://swapi.co/ - the Star Wars API
![Starwars](https://s3.amazonaws.com/f.cl.ly/items/1r2F2K460v1R2o011n1M/star-wars-evolution-evolution-funny.jpg)

## API Support
- [x] Films API
- [x] People API
- [x] Planet API
- [x] Species API
- [x] Vehicles API
- [x] Starship API


## Installation

Add this line to your application's Gemfile:

    gem 'starwars'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install starwars

## Usage

```ruby
require "starwars"
luke = Starwars::Person.fetch(1)
p luke.name
p luke.height

falcon = Starwars::Starship.new(id: 10)
falcon.fetch
puts falcon.name
puts falcon.pilots
```
  
you can also nest the quries, such as:

```ruby    
falcon.pilots.each do |pilot|
  puts pilot.fetch.name
end
```

You can load a resouce by url:

```ruby    
aldeeran = Starwars::Planet.new(url: 'http://swapi.co/api/planets/3/').fetch
puts aldeeran.name
puts aldeeran.residents
puts aldeeran.population
```

<<<<<<< Local Changes
<<<<<<< Local Changes
To iterate pages you can use the following interface:

```ruby
Starwars::Starship.fetch_all.each{|page|
  p page.next
  p page.previous
  p page.results.size
}
```

=======
>>>>>>> External Changes
=======
>>>>>>> External Changes
## Contributing

1. Fork it ( https://github.com/moski/starwars/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
