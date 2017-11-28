class Oystercard
  attr_accessor :balance, :in_journey
  MAXIMUM_BALANCE = 90
  FARE = 1 #added a constant for the journey fare

  def initialize
    @balance = 0
    @in_journey = false
  end
  def top_up(deposit)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if deposit + @balance > MAXIMUM_BALANCE
    @balance += deposit
  end
  def deduct(fare)
    @balance -= fare
  end
  def touch_in
    #fare is deducted during touch in
    fail 'Insufficient funds' if FARE > balance
    @in_journey = true
  end
  def touch_out
    @in_journey = false
  end
end
