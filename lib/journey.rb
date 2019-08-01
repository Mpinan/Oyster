require_relative 'Station'
require_relative 'Oystercard'

class Journey

PENALTY_FARE = 1
	
	def initialize
		@journey_complete = false
	end
    def started?
		@journey_complete 
	end
	def finish?
		@journey_complete = true
	end
	def fare
		fare = PENALTY_FARE
	end
		#def new_journey
     # { :entry_station => nil, :exit_station => nil }
		#end
end