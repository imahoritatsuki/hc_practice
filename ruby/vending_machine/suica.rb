class Suica
  attr_reader :balance

  def initialize
    @balance = 500
  end

  def deduct(amount)
    raise "残高が足りません" if amount > @balance
    @balance -= amount
  end
  
  def charge(amount)
    raise "100円以上を入金してください" if amount < 100
    @balance += amount
  end

end