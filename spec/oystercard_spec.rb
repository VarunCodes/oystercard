require 'oystercard'

describe Oystercard do

  it 'initial balance' do
    expect(subject.balance).to eq 0
  end

    it 'top up success' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'error raised if balance limit is exceeded' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect{ subject.top_up(0.01) }.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
    end
  end

context 'transit' do
  describe '#in_journey' do
    it 'where am i' do
      expect(subject).to respond_to(:in_journey)
    end
  end
  describe '#touch_in' do
    it 'touch in success' do
      subject.top_up(5)
      subject.touch_in
      expect( subject.in_journey ).to eq true
    end
    it 'touch out fail if lack of balance' do
      expect { subject.touch_in }.to raise_error 'Insufficient funds'
    end
  end
  describe '#touch_out' do
    it 'touch out success' do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect( subject.in_journey ).to eq false
    end
    it 'deduct fare success' do
      expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::FARE)
    end
  end

 end
end
