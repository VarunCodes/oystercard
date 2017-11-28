class Oystercard
  attr_accessor :balance, :in_journey
  MAXIMUM_BALANCE = 90
  FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end
  def top_up(deposit)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if deposit + @balance > MAXIMUM_BALANCE
    @balance += deposit
  end
  def touch_in
    fail 'Insufficient funds' if FARE > balance
    @in_journey = true
  end
  def touch_out
    deduct
    @in_journey = false
  end

  private
  def deduct(fare = FARE)
    @balance -= fare
  end
end
