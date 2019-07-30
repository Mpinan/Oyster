
class Oystercard
    MAXIMUM_BALANCE = 100
    MINIMUM_BALANCE = 1
    MIN_JOURNEY_COST = 5
    attr_reader :balance
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    @balance += amount
    fail 'You cannot put more money' if @balance > MAXIMUM_BALANCE 
  end
  def deduct(amount) 
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail 'Insuficient balance' if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    #Should deduct Journey_cost from balance when touch out
    #Sample: @Balance - MIN_JORNEY_COST 
    deduct(MIN_JOURNEY_COST)
    @in_journey = false
  end
end

