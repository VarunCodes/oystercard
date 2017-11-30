require 'journey'

describe Journey do
  subject(:journey) {described_class.new(station) }
  let(:station) { double(:station) }

  describe "#initialize" do
    it 'starts a journey' do
      journey = Journey.new(station)
      expect(journey.entry_station).to eq station
    end
  end

  describe "#finish" do
    it "sets an exit station" do
      journey.finish(station)
      expect(journey.exit_station).to eq station
    end
    it "sets a journey as complete" do
      journey.finish(station)
      expect(journey).to be_complete
    end
  end


end


#it should be responsible for starting a journey, finishing a journey,
#calculating the fare of a journey, and returning whether or not the journey is complete.
