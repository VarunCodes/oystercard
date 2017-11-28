require 'oystercard'

describe Oystercard do

  it 'initial balance' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'top up success' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'error raised if balance limit is exceeded' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect{ subject.top_up(0.01) }.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
    end
  end

  describe 'deducts fare' do
    it 'deduct success' do
      #checks if the proper fare has been deducted from balance
      expect{ subject.deduct 1 }.to change{subject.balance }.by -1
    end
    #it { is_expected.to respond_to(:deduct).with(1).argument }
  end
context 'transit' do
  describe '#in_journey' do
    it 'where am i' do
      expect(subject).to respond_to(:in_journey)
    end
  end
  describe '#touch_in' do
    it 'touch in success' do
      subject.touch_in
      expect( subject.in_journey ).to eq true
    end
  end
  describe '#touch_out' do
    it 'touch out success' do
      subject.touch_in
      subject.touch_out
      expect( subject.in_journey ).to eq false
    end
  end

end


end
