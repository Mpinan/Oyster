require_relative 'station'
class Oystercard
    MAXIMUM_BALANCE = 100
    MINIMUM_FAIR = 1
    attr_reader :balance, :journeys

    def initialize
      @balance = 0
      @current_journey = new_journey
      @journeys = []

    end

    def top_up(amount)
      fail 'Cannot top up: Max balance exceeded' if max_balance?(amount)

      @balance += amount
    end
  
    def touch_in(station)
      fail 'Cannot touch in: Insufficient balance' if no_balance?
      fail 'Cannot touch in: Already in journey' if in_journey?

      @current_journey[:entry_station] = station
    end

    def touch_out(station)
      fail "Cannot touch out: didn't touch in" unless in_journey?

      deduct(MINIMUM_FAIR)
      @current_journey[:exit_station] = station
      @journeys << @current_journey
      @current_journey = new_journey
    end

    private

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
      !@current_journey[:entry_station].nil?
    end

    def max_balance?(amount)
      amount + @balance > MAXIMUM_BALANCE
    end

    def no_balance?
      @balance < MINIMUM_FAIR
    end

    def new_journey
      { :entry_station => nil, :exit_station => nil }
    end
end

