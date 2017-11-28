require 'oystercard'

describe Oystercard do

  it 'initial balance' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    #checks if an amount has been entered
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'top up success' do
      #checks if the proper amount has been added to the balance
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'error raised if balance limit is exceeded' do
      #checks if an error is raised when the balance cap is exceeded by a deposit
      maximum_balance = subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect{ subject.top_up(0.01) }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
    end
  end

end
