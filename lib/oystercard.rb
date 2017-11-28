require_relative 'station'

class Oystercard
  attr_accessor :balance, :entry_station
  MAXIMUM_BALANCE = 90
  FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end
  def top_up(deposit)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if deposit + @balance > MAXIMUM_BALANCE
    @balance += deposit
  end
  def touch_in(station)
    fail 'Insufficient funds' if FARE > balance
    @entry_station = station.name
  end
  def touch_out
    deduct
    @entry_station = nil
  end
  def in_journey?
    !!@entry_station
  end

  private
  def deduct(fare = FARE)
    @balance -= fare
  end
end
