describe Starwars::Vehicle do
  before do
    stub_get('/vehicles/14/').to_return(body: fixture('vehicles_14.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end

  describe '#==' do
    it 'returns true when objects IDs and URLS are the same' do
      starship = Starwars::Vehicle.new(id: 1, title: 'foo')
      other = Starwars::Vehicle.new(id: 1, title: 'bar')
      expect(starship == other).to be true
    end

    it 'returns false when objects IDs are different' do
      starship = Starwars::Vehicle.new(id: 1)
      other = Starwars::Vehicle.new(id: 2)
      expect(starship == other).to be false
    end
  end

  describe 'getters' do
    subject(:vehicle) { Starwars::Vehicle.fetch(14) }
    describe '#created' do
      it 'returns a Time when updated is set' do
        expect(vehicle.created).to be_a Time
      end
    end
    describe '#edited' do
      it 'returns a Time when edited is set' do
        expect(vehicle.edited).to be_a Time
      end
    end
    describe '#name' do
      it 'should have the correct value' do
        expect(vehicle.name).to eq 'Snowspeeder'
      end
    end
    describe '#model' do
      it 'should have the correct value' do
        expect(vehicle.model).to eq 't-47 airspeeder'
      end
    end
    describe '#manufacturer' do
      it 'should have the correct value' do
        expect(vehicle.manufacturer).to eq 'Incom corporation'
      end
    end
    describe '#vehicle_class' do
      it 'should have the correct value' do
        expect(vehicle.vehicle_class).to eq 'airspeeder'
      end
    end
    describe '#consumables' do
      it 'should have the correct value' do
        expect(vehicle.consumables).to eq 'none'
      end
    end
    describe '#cost_in_credits' do
      it 'should should have the correct value' do
        expect(vehicle.cost_in_credits).to eq 'unknown'
      end
    end
    describe '#length' do
      it 'should be an integer' do
        expect(vehicle.length).to be_an Float
      end
      it 'should should have the correct value' do
        expect(vehicle.length).to eq 4.5
      end
    end
    describe '#max_atmosphering_speed' do
      it 'should be an integer' do
        expect(vehicle.max_atmosphering_speed).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(vehicle.max_atmosphering_speed).to eq 650
      end
    end
    describe '#crew' do
      it 'should be an integer' do
        expect(vehicle.crew).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(vehicle.crew).to eq 2
      end
    end
    describe '#passengers' do
      it 'should be an integer' do
        expect(vehicle.passengers).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(vehicle.passengers).to eq 0
      end
    end
    describe '#cargo_capacity' do
      it 'should be an integer' do
        expect(vehicle.cargo_capacity).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(vehicle.cargo_capacity).to eq 10
      end
    end

    describe '#films' do
      it 'should return an Array' do
        expect(vehicle.films).to be_an Array
      end
      it 'should should the correct number of films' do
        expect(vehicle.films.size).to eq 1
      end
      it 'should contain an array of films correctly parsed' do
        film = vehicle.films.first
        expect(film).to be_a Starwars::Film
        expect(film.url).to eq 'http://swapi.co/api/films/2/'
      end
    end
    describe '#pilots' do
      it 'should return an Array' do
        expect(vehicle.pilots).to be_an Array
      end
      it 'should should the correct number of pilots' do
        expect(vehicle.pilots.size).to eq 2
      end
      it 'should contain an array of pilots correctly parsed' do
        person = vehicle.pilots.first
        expect(person).to be_a Starwars::Person
        expect(person.url).to eq 'http://swapi.co/api/people/1/'
      end
    end
  end
end
