require 'oystercard.rb'

describe Oystercard do
  let(:station) { double(:my_station, name: "name")}
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
    it 'remember entry_station upon touch-in' do
      card.top_up(20)
      card.touch_in(station)
      expect( card.entry_station ).to eq station.name
    end
  end
  describe '#touch_out' do
    it 'touch out success' do
      card.top_up(5)
      card.touch_in(station)
      card.touch_out
      expect( card ).to_not be_in_journey
    end
    it 'deduct fare success' do
      expect { card.touch_out }.to change{ card.balance }.by(-Oystercard::FARE)
    end
    it 'clears station data upon touch-out' do
      card.top_up(5)
      card.touch_in(station)
      card.touch_out
      expect( card.entry_station ).to eq nil
    end
  end
end
end
