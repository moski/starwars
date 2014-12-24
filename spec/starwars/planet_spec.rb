describe Starwars::Planet do
  before do
    stub_get('/planets/1/').to_return(body: fixture('planets_1.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end

  describe '#==' do
    it 'returns true when objects IDs and URLS are the same' do
      planet = Starwars::Planet.new(id: 1, name: 'foo')
      other = Starwars::Planet.new(id: 1, name: 'bar')
      expect(planet == other).to be true
    end

    it 'returns false when objects IDs are different' do
      planet = Starwars::Planet.new(id: 1)
      other = Starwars::Planet.new(id: 2)
      expect(planet == other).to be false
    end
  end

  describe 'getters' do
    subject(:planet) { Starwars::Planet.fetch(1) }
    describe '#created' do
      it 'returns a Time when updated is set' do
        expect(planet.created).to be_a Time
      end
    end
    describe '#edited' do
      it 'returns a Time when edited is set' do
        expect(planet.edited).to be_a Time
      end
    end

    describe '#name' do
      it 'should have the correct value' do
        expect(planet.name).to eq 'Tatooine'
      end
    end
    describe '#terrain' do
      it 'should have the correct value' do
        expect(planet.terrain).to eq 'desert'
      end
    end
    describe '#gravity' do
      it 'should have the correct value' do
        expect(planet.gravity).to eq '1 standard'
      end
    end
    describe '#climate' do
      it 'should have the correct value' do
        expect(planet.climate).to eq 'arid'
      end
    end
    describe '#url' do
      it 'should have the correct value' do
        expect(planet.url).to eq 'http://swapi.co/api/planets/1/'
      end
    end

    describe '#population' do
      it 'should be an integer' do
        expect(planet.population).to be_an Integer
      end

      it 'should should have the correct value' do
        expect(planet.population).to eq 200_000
      end
    end
    describe '#surface_water' do
      it 'should be an integer' do
        expect(planet.surface_water).to be_an Integer
      end
      it 'should have the correct value' do
        expect(planet.surface_water).to eq 1
      end
    end
    describe '#rotation_period' do
      it 'should be an integer' do
        expect(planet.rotation_period).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(planet.rotation_period).to eq 23
      end
    end
    describe '#orbital_period' do
      it 'should be an integer' do
        expect(planet.rotation_period).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(planet.orbital_period).to eq 304
      end
    end
    describe '#diameter' do
      it 'should be an integer' do
        expect(planet.diameter).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(planet.diameter).to eq 104_65
      end
    end

    describe '#residents' do
      it 'should return an Array' do
        expect(planet.residents).to be_an Array
      end
      it 'should should the correct number of residents' do
        expect(planet.residents.size).to eq 10
      end
      it 'should contain an array of people correctly parsed' do
        person = planet.residents.first
        expect(person).to be_a Starwars::Person
        expect(person.url).to eq 'http://swapi.co/api/people/1/'
      end
    end
    describe '#films' do
      it 'should return an Array' do
        expect(planet.films).to be_an Array
      end
      it 'should should the correct number of residents' do
        expect(planet.films.size).to eq 5
      end
      it 'should contain an array of films correctly parsed' do
        film = planet.films.first
        expect(film).to be_a Starwars::Film
        expect(film.url).to eq 'http://swapi.co/api/films/1/'
      end
    end
  end
end
