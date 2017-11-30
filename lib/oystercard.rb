require_relative 'station'
require_relative 'journey'
class Oystercard
  attr_accessor :balance, :journey_log
  MAXIMUM_BALANCE = 90
  DEFAULT_MINIMUM = 1

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(deposit)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if deposit + @balance > MAXIMUM_BALANCE
    @balance += deposit
  end

  def touch_in(station)
    fail 'Insufficient funds' if DEFAULT_MINIMUM > balance
    deduct(@journey_log.start(station))
  end

  def touch_out(station)
    deduct(@journey_log.finish(station))
  end

  def in_journey?
    @journey_log.in_journey?
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
