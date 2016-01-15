require 'minitest/autorun'
require 'minitest/pride'
require_relative 'person'
require_relative 'bank'
class PersonTest < MiniTest::Test
  def test_person_has_a_name
    person = Person.new("Matt")

    assert_equal "Matt", person.name
  end

  def test_person_can_be_instantiated_with_galleons
    person = Person.new("Matt", 100)

    assert_equal 100, person.galleons
  end

  def test_multiple_people_can_be_instantiated_with_name_and_galleons
    person1 = Person.new("Matt", 100)
    person2 = Person.new("Brian", 200)

    assert_equal "Matt", person1.name
    assert_equal "Brian", person2.name
    assert_equal 100, person1.galleons
    assert_equal 200, person2.galleons
  end
end

class BankTest < MiniTest::Test
  def test_bank_has_a_title
    bank = Bank.new("Wells Fargo")

    assert_equal "Wells Fargo", bank.title
  end

  def test_bank_can_open_account_with_instance_of_person
    person = Person.new("Matt", 100)
    bank = Bank.new("Wells Fargo")

    assert bank.open_account(person).instance_of?(Person)
  end

  def test_bank_can_open_account_for_person_with_a_name
    person = Person.new("Matt", 100)
    bank = Bank.new("Wells Fargo")

    assert_equal "Matt", bank.open_account(person.name)
  end

  def test_bank_accepts_deposit_that_correlates_with_persons_galleons
    person = Person.new("Brian", 400)
    bank = Bank.new("Wells Fargo")


    assert_equal 300, bank.deposit(person, 100)
  end

  def test_bank_will_not_deposit_more_than_persons_galleons
    person = Person.new("Brian", 400)
    bank = Bank.new("Wells Fargo")


    assert_equal "You're broke", bank.deposit(person, 10000)
  end

  def test_can_check_current_balance
    person = Person.new("Brian", 400)
    bank = Bank.new("Wells Fargo")

    bank.deposit(person, 100)

    assert_equal 100, bank.check_balance


  end


  def test_bank_accepts_withdrawal_request_that_correlates_with_persons_galleons
    person = Person.new("Brian", 400)
    bank = Bank.new("Wells Fargo")
    bank.deposit(person, 100)
    bank.withdrawal(person, 40)
    assert_equal 60, bank.check_balance
  end

  def test_bank_will_not_allow_withdrawals_that_exceed_account_balance

    person = Person.new("Brian", 400)
    bank = Bank.new("Wells Fargo")

    bank.deposit(person, 100)
    bank.withdrawal(person, 200)

    assert_equal "insufficient funds", bank.withdrawal(person,200)
    assert_equal 100, bank.check_balance
  end
end
