class Journey

  attr_accessor :entry_station, :exit_station, :complete
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
    @complete = false

  end

  def finish(exit_station)
    @exit_station = exit_station
    @complete = true
  end

  def fare
    !entry_station || !exit_station ? PENALTY_FARE : MINIMUM_FARE
  end

  def complete?
    @complete
  end

end
