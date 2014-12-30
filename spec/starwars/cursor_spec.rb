describe Starwars::Cursor do
  let(:resource) { Starwars::Planet }
  let(:uri) { 'http://swapi.co/api/planets/' }
  let(:as) { Starwars::Request::FORMAT }
  let(:params) { { two: 2 } }
  let(:method) { :get }
  let(:cursor) do
    Starwars::Cursor.new
  end

  describe '#last_page?' do
    it 'returns true if so' do
      cursor.next = nil
      expect(cursor.last_page?).to eq(true)
    end

    it 'returns false if not' do
      cursor.next = '/something'
      expect(cursor.last_page?).to eq(false)
    end
  end

  describe '#next_page?' do
    it 'returns true if so' do
      cursor.next = '/something'
      expect(cursor.next_page?).to eq(true)
    end

    it 'returns false if not' do
      cursor.next = nil
      expect(cursor.next_page?).to eq(false)
    end
  end

  describe '#next_page' do
    let(:request_response) do
      double(body: { results: [], next: '/something', pervious: nil })
    end
    before :each do
      allow(cursor).to receive(:perform_request).and_return(request_response)
    end

    it 'returns nil if there are no more pages' do
      cursor.next = nil
      expect(cursor.next_page).to eq(nil)
    end

    it 'performs a request' do
      cursor.next = 'http://swapi.co/api/planets/?page=2'
      expect(cursor).to receive(:perform_request)
      cursor.next_page
    end
  end

  describe '#each_page' do
    it 'should return an enumerator if no block is provided' do
      expect(cursor.each_page).to be_an(Enumerator)
    end

    it 'yields till no more pages' do
      request_responses = [
        double(body: { previous: nil, results: [1, 2, 3, 4] }),
        double(body: { next: '/next/next', previous: '/previous', results: [1, 2, 3, 4] }),
        double(body: { next: nil, previous: '/previous', results: [1, 2, 3, 4] })
      ]
      cursor.next = '/something'
      allow(cursor).to receive(:perform_request).and_return(request_responses[0])
      expect(cursor).to receive(:perform_request).exactly(4).times

      cursor.each_with_index do |_, index|
        allow(cursor).to receive(:perform_request).and_return(request_responses[index])
        cursor.next = request_responses[index]
      end
    end
  end
end
