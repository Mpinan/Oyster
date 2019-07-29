
class Oystercard
    MAXIMUM_BALANCE = 100
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
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end

