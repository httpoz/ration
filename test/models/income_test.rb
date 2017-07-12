require 'test_helper'

class IncomeTest < ActiveSupport::TestCase

  def setup
    @budget = budgets(:one)
    @income = @budget.incomes.build(name: "paycheck", amount: "123.123", date: Date.today, monthly: false)
  end
  
  test "should be valid" do
    assert @income.valid?
  end
  
  test "name should be correct length" do
    @income.name = ""
    assert_not @income.valid? 
    @income.name = "a" * 31
    assert_not @income.valid?
  end
  
  test "budget should be present" do
    @income.budget_id = nil
    assert_not @income.valid?
  end
  
  test "amount should be decimal and positive" do
    invalid_amounts = ["asd", "", 0, "123,23", -123]
    invalid_amounts.each do |invalid_amount|
      @income.amount = invalid_amount
      assert_not @income.valid?
    end
  end
  
  test "date should be present" do
    @income.date = ""
    assert_not @income.valid?
  end
end
