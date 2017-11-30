require_relative 'station'
require_relative 'journey'
class Oystercard
  attr_accessor :balance, :journey_log
  MAXIMUM_BALANCE = 90
  DEFAULT_MINIMUM = 1

  def initialize
    @balance = 0
    @journey_log = []
  end
  def top_up(deposit)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if deposit + @balance > MAXIMUM_BALANCE
    @balance += deposit
  end
  def touch_in(station)
    fail 'Insufficient funds' if DEFAULT_MINIMUM > balance
    deduct(current_journey.fare) if in_journey?
    @current_journey = Journey.new(station)
  end
  def touch_out(station)
    @current_journey ||= Journey.new(nil)
    current_journey.finish(station)
    deduct current_journey.fare
    @journey_log << current_journey
  end
  def in_journey?
    !!(current_journey && !current_journey.complete?)
  end

  private
  def deduct(fare)
    @balance -= fare
  end

  def current_journey
    @current_journey
  end

end
