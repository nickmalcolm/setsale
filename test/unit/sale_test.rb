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
  
  test "sale needs a start date and end date" do
    @blank.starts_at = Time.now
    @blank.ends_at = Time.now
    
    assert @blank.valid?
  end
  
  test "factory works" do
    assert Factory(:sale).valid?
  end
  
end