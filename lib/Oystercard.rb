class Oystercard
    MAXIMUM_BALANCE = 100
    MINIMUN_FAIR = 1
    attr_reader :balance, :entry_station

    def initialize
      @balance = 0
      @in_journey = false
    end

    def top_up(amount)
      fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
      @balance += amount
    end

    def in_journey?
      @in_journey
      !!entry_station
    end
  
    def touch_in(station)
      fail 'Insufficient balance' if @balance < MINIMUN_FAIR
      @in_journey = true
    end

    def touch_out
      deduct(MINIMUN_FAIR)
      @entry_station = nil
      @in_journey = false
    end

    private

    def deduct(amount)
        @balance -= amount
    end
end

