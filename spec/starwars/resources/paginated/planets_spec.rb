describe Starwars::Planets do
  before do
    stub_get('/planets/').to_return(body: fixture('planets_page1.json'), headers: { content_type: 'application/json; charset=utf-8' })
    stub_get('/planets/?page=2').to_return(body: fixture('planets_page2.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end
  describe 'getters' do
    subject(:planets) { Starwars::Planet.fetch_all }
    describe '#number_of_pages' do
      it 'should have the correct value' do
        expect(planets.number_of_pages).to eq 60
      end
    end
    describe '#next' do
      it 'should have the correct value' do
        expect(planets.next).to eq 'http://swapi.co/api/planets/?page=2'
      end
    end
    describe '#previous' do
      it 'should have the correct value' do
        expect(planets.previous).to eq nil
      end
    end
    describe '#results' do
      it 'should have the correct size' do
        expect(planets.results.size).to eq 10
      end
      it 'should have the correct type' do
        expect(planets.results.first).to be_a Starwars::Planet
      end
    end
    describe '#next_page' do
      it 'should fetch the next page' do
        planets.next_page
        expect(planets.next).to eq 'http://swapi.co/api/planets/?page=3'
      end
    end
  end
end
