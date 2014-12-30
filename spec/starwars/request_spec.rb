describe Starwars::Request do
  let(:resource) { Starwars::Planet }
  let(:uri) { 'http://swapi.co/api/planets/100/' }
  let(:as) { Starwars::Request::FORMAT }
  let(:params) { { two: 2 } }
  let(:method) { :get }

  let(:request) do
    Starwars::Request.new(resource: resource.new, uri: uri, method: method, as: as, params: { moski: true })
  end

  before do
    stub_get('/planets/100/').to_return(status: [404, 'NOT FOUND'], body: fixture('404.json'), headers: { content_type: 'application/json; charset=utf-8' })
    stub_get('/planets/1/').to_return(body: fixture('planets_1.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end

  describe '#perform_request' do
    let(:perform_request) { -> { request.send(:perform_request) } }
    it 'runs the request and verifies it' do
      allow(request).to receive(:perform_request)
      expect(request).to receive(:perform_request)
      perform_request.call
    end

    it 'raises an exception when data not found' do
      expect { request.perform_request }.to raise_error(Starwars::Error::NotFound)
    end
  end
end
