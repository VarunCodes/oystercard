class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end
  def top_up(deposit)
    fail 'Maximum balance of #{maximum_balance} exceeded' if deposit + @balance > MAXIMUM_BALANCE
    @balance += deposit
  end
  def deduct(fare)
    @balance -= fare #fare is deducted from balance
  end
end
