require 'journey_log.rb'

describe JourneyLog do

  subject(:journey_log) { described_class.new }
  let(:journey) { double(:journey, finish: nil, fare: nil, complete: nil) }
  let(:journey_class) { double(:journey_class, new: journey) }
  let(:station) { double(:station) }

  # describe "#start" do
  #   it "creates a new journey" do
  #     journey_class.start(station)
  #     expect(journey).to eq true
  #   end
  # end













end
