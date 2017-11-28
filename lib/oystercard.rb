class Oystercard
  attr_accessor :balance, :in_journey
  MAXIMUM_BALANCE = 100

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
    @in_journey = true
  end
  def touch_out
    @in_journey = false
  end
end
