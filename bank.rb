class Bank
  attr_reader :title

  def initialize(title)
    @title = title
    @cash = 0
    @balance = 0
  end

  def open_account(person)
    person
  end

  def deposit(person, ammount)
    if ammount > person.galleons
      "You're broke"
    else
      @balance += ammount
      @cash = person.galleons - ammount
    end
  end

  def withdrawal(person, ammount)
    if ammount > @balance
      "insufficient funds"
    else
      @balance -= ammount
      @cash = person.galleons + ammount
    end
  end

  def check_balance
    @balance
  end

end
