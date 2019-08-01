require_relative "Station"
require_relative "Oystercard"

class Journey
  PENALTY_FARE = 1

  def initialize
    @journey_complete = false
  end

  def complete?
    @journey_complete
  end

  def finish(station)
    @journey_complete = true
    self
  end

  def fare(fare = PENALTY_FARE)
    fare
  end

  def entry_station(station)
    station
  end
end
