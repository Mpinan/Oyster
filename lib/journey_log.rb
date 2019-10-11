class JourneyLog
 def initialize(journey_class = Journey.new )
    @journey_class = journey_class
    @journeys = []
 end

 def start(station)
   @journeys << station
 end

 def finish(station)
   @journeys << station
 end

 def 
end