describe Starwars::Specie do
  before do
    stub_get('/species/1/').to_return(body: fixture('species_1.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end

  describe '#==' do
    it 'returns true when objects IDs and URLS are the same' do
      specie = Starwars::Specie.new(id: 1, title: 'foo')
      other = Starwars::Specie.new(id: 1, title: 'bar')
      expect(specie == other).to be true
    end

    it 'returns false when objects IDs are different' do
      specie = Starwars::Specie.new(id: 1)
      other = Starwars::Specie.new(id: 2)
      expect(specie == other).to be false
    end
  end
  describe 'getters' do
    subject(:specie) { Starwars::Specie.fetch(1) }
    describe '#created' do
      it 'returns a Time when updated is set' do
        expect(specie.created).to be_a Time
      end
    end
    describe '#edited' do
      it 'returns a Time when edited is set' do
        expect(specie.edited).to be_a Time
      end
    end

    describe '#name' do
      it 'should have the correct value' do
        expect(specie.name).to eq 'Human'
      end
    end
    describe '#classification' do
      it 'should have the correct value' do
        expect(specie.classification).to eq 'mammal'
      end
    end
    describe '#designation' do
      it 'should have the correct value' do
        expect(specie.designation).to eq 'sentient'
      end
    end
    describe '#skin_colors' do
      it 'should have the correct value' do
        expect(specie.skin_colors).to eq 'caucasian, black, asian, hispanic'
      end
    end
    describe '#hair_colors' do
      it 'should have the correct value' do
        expect(specie.hair_colors).to eq 'blonde, brown, black, red'
      end
    end
    describe '#eye_colors' do
      it 'should have the correct value' do
        expect(specie.eye_colors).to eq 'brown, blue, green, hazel, grey, amber'
      end
    end
    describe '#language' do
      it 'should have the correct value' do
        expect(specie.language).to eq 'Galactic Basic'
      end
    end
    describe '#url' do
      it 'should have the correct value' do
        expect(specie.url).to eq 'http://swapi.co/api/species/1/'
      end
    end

    describe '#homeworld' do
      it 'should return a Starwars::Planet object' do
        expect(specie.homeworld).to be_an Starwars::Planet
      end
      it 'should contains the correct resouce url' do
        expect(specie.homeworld.url).to eq 'http://swapi.co/api/planets/9/'
      end
    end

    describe '#average_height' do
      it 'should be an integer' do
        expect(specie.average_height).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(specie.average_height).to eq 180
      end
    end
    describe '#average_lifespan' do
      it 'should be an integer' do
        expect(specie.average_lifespan).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(specie.average_lifespan).to eq 120
      end
    end
    describe '#people' do
      it 'should return an Array' do
        expect(specie.people).to be_an Array
      end
      it 'should should the correct number of people' do
        expect(specie.people.size).to eq 4
      end
      it 'should contain an array of people correctly parsed' do
        person = specie.people.first
        expect(person).to be_a Starwars::Person
        expect(person.url).to eq 'http://swapi.co/api/people/66/'
      end
    end
    describe '#films' do
      it 'should return an Array' do
        expect(specie.films).to be_an Array
      end
      it 'should should the correct number of films' do
        expect(specie.films.size).to eq 6
      end
      it 'should contain an array of films correctly parsed' do
        film = specie.films.first
        expect(film).to be_a Starwars::Film
        expect(film.url).to eq 'http://swapi.co/api/films/1/'
      end
    end
  end
end
