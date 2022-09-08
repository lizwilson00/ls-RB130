# RB130
# Exercises
# Medium 2 Testing
# Take 2

# cash_register_take2_test.rb
require 'minitest/autorun'

require_relative 'cash_register_take2'
require_relative 'transaction_take2'

class CashRegisterTest < MiniTest::Test
  def test_accept_money
    cash_register = CashRegister.new(100)
    trans = Transaction.new(15)
    trans.amount_paid = 20
    before_amount = cash_register.total_money
    cash_register.accept_money(trans)
    after_amount = cash_register.total_money
    assert_equal before_amount + 20, after_amount
  end

  def test_change
    cash_register = CashRegister.new(100)
    trans = Transaction.new(15)
    trans.amount_paid = 20
    assert_equal 5, cash_register.change(trans)
  end

  def test_give_receipt
    cash_register = CashRegister.new(100)
    trans = Transaction.new(15)
    assert_output(stdout = "You've paid $15.\n") { cash_register.give_receipt(trans) }
  end
end