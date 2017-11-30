require 'oystercard.rb'
require 'journey.rb'
require 'station.rb'

describe Oystercard do
  let(:station) { double(:my_station, name: "name", zone: 1)}
  subject(:card) { described_class.new }

  it 'initial balance' do
    expect(card.balance).to eq 0
  end
    it 'top up success' do
      expect{ card.top_up 1 }.to change{ card.balance }.by 1
    end
    it 'error raised if balance limit is exceeded' do
      card.top_up(Oystercard::MAXIMUM_BALANCE)
      expect{ card.top_up(0.01) }.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
    end

  context 'transit' do
    describe '#in_journey' do
      it 'where am i' do
        expect( card ).to respond_to(:in_journey?)
      end
    end
    describe '#touch_in' do
      it 'touch in success' do
        card.top_up(5)
        card.touch_in(station)
        expect( card ).to be_in_journey
      end
      it 'touch out fail if lack of balance' do
        expect { card.touch_in(station) }.to raise_error 'Insufficient funds'
      end
      it "charges a penalty fare if the last journey wasn't touched out" do
        card.top_up(Journey::MINIMUM_FARE)
        card.touch_in(station)
        expect{ card.touch_in(station) }.to change{ card.balance }.by(-Journey::PENALTY_FARE)
      end
    end

    describe '#touch_out' do
      before do
        card.top_up(20)
      end
      it 'deduct fare success' do
        card.touch_in(station)
        expect { card.touch_out(station) }.to change{ card.balance }.by(-Oystercard::DEFAULT_MINIMUM)
      end
      it 'touch out success' do
        expect( card ).to_not be_in_journey
      end
      it 'penalty fare if no entry station' do
        expect{ card.touch_out(station) }.to change{ card.balance }.by(-Journey::PENALTY_FARE)
      end
    end
  end
end
