require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  
  def setup
    @blank = Sale.new
  end
  
  test "sale invalid when blank" do
    assert @blank.invalid?
  end
  
  test "sale invalid with just start date" do
    @blank.starts_at = Time.now
    assert @blank.invalid?
  end
  
  test "sale invalid with just end date" do
    @blank.ends_at = Time.now
    assert @blank.invalid?
  end
  
  test "sale invalid with just discount amount" do
    @blank.amount = 4.95
    assert @blank.invalid?
  end
  
  test "sale needs a start date, end date, amount, and amount type" do
    @blank.starts_at = Time.now
    @blank.ends_at = Time.now
    @blank.amount = 4.95
    @blank.amount_type = "fixed"
    
    assert @blank.valid?
  end
  
  test "factory works" do
    assert Factory(:sale).valid?
  end
  
  test "amount type can be fixed" do
    s = Factory(:sale, :amount_type => "fixed")
    assert s.valid?
  end
  
  test "amount type can be percentage" do
    s = Factory(:sale, :amount_type => "percentage")
    assert s.valid?
  end
  
  test "amount type can't be random" do
    s = Factory(:sale)
    
    s.amount_type = "asdsad"
    assert s.invalid?
    
    s.amount_type = ""
    assert s.invalid?
    
    s.amount_type = nil
    assert s.invalid?
  end
  
end