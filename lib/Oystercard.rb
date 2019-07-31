class Oystercard
    MAXIMUM_BALANCE = 100
    MINIMUM_FAIR = 1
    attr_reader :balance, :entry_station

    def initialize
      @balance = 0
      @entry_station = nil
    end

    def top_up(amount)
      fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
      @balance += amount
    end

    def in_journey?
      !entry_station.nil?
    end
  
    def touch_in(station)
      fail 'Insufficient balance' if @balance < MINIMUM_FAIR
      @entry_station = station
    end

    def touch_out
      deduct(MINIMUM_FAIR)
      @entry_station = nil
      #@in_journey = false
    end

    private

    def deduct(amount)
        @balance -= amount
    end
end

