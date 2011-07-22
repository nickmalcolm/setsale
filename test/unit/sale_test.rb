require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  
  def setup
    @blank = Sale.new
  end
  
  test "sale invalid when blank" do
    assert @blank.invalid?
  end

  test "sale needs a start date, end date, amount, amount type, and shop" do
    @blank.starts_at = Time.now
    @blank.ends_at = Time.now
    @blank.amount = 4.95
    @blank.amount_type = "fixed"
    @blank.shop = Factory(:shop)

    assert @blank.valid?
  end

  test "factory works" do
    assert Factory(:sale).valid?
  end
  
  test "sale invalid without start date" do
    assert Factory.build(:sale, :starts_at => nil).invalid?
  end
  
  test "sale invalid without end date" do
    assert Factory.build(:sale, :ends_at => nil).invalid?
  end
  
  test "sale invalid without discount amount" do
    assert Factory.build(:sale, :amount => nil).invalid?
  end
  
  test "sale invalid without amount type" do
    assert Factory.build(:sale, :amount_type => nil).invalid?
  end
  
  test "sale invalid without shop" do
    assert Factory.build(:sale, :shop => nil).invalid?
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
  end
  
end