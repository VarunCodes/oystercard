class JourneyLog

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry)
    fare = (!!current_journey.entry_station ? PENALTY_FARE : 0)
    @current_journey = @journey_class.new(entry)
    fare
  end

  def finish(exit_station)
    current_journey.finish(exit_station)
    add_journey
    current_journey.fare
  end

  def in_journey?
    !!(current_journey.entry_station && !current_journey.complete?)
  end

  private

  def current_journey
    @current_journey ||= @journey_class.new(nil)
  end

  def add_journey
    @journeys << @current_journey
  end

end
