
class Oystercard
    MAXIMUM_BALANCE = 100
    JOURNEY_COST = 5
    attr_reader :balance
  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    current_balance = @balance += amount
    fail 'You cannot put more money' if current_balance > MAXIMUM_BALANCE 
  end
  def deduct(amount)
    current_balance = @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail 'Insuficient balance' if balance < JOURNEY_COST
    @in_journey = true
  end

  def touch_out
    #Should deduct Journey_cost from balance when touch out
    #Sample: @Balance - Journey_cost 
    @in_journey = false
  end
 
end

