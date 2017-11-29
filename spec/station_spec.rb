require 'station'
require 'oystercard'

describe Station do
  subject(:station) { described_class.new('name', 'zone') }

  describe 'initialize' do
    it 'provides station name' do
      expect(subject).to respond_to(:name)
    end
    it 'provides a zone' do
      expect(subject).to respond_to(:zone)
    end
  end

end
