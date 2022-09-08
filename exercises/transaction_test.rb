# RB130
# Exercises
# Medium 2 Testing

# transaction_test.rb
require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment_amount_paid
    transaction = Transaction.new(15)
    input = StringIO.new("20\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 20, transaction.amount_paid
  end
end