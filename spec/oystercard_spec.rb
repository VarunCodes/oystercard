require 'oystercard'

describe Oystercard do
  it 'initial balance' do
    expect(subject.balance).to eq 0
  end
end
