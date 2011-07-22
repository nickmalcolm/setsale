require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  
  def setup
    @blank = Shop.new
  end
  
  test "invalid without domain" do
    assert @blank.invalid?
  end
  
  test "valid with domain" do
    @blank.domain = "bob.com"
    assert @blank.valid?
  end
  
  test "Factory works" do
    assert Factory(:shop).valid?
  end
  
  test "can have sales" do
    s = Factory(:shop)
    s1 = Factory(:sale, :shop => s)
    
    assert s.sales.include? s1
  end
  
  test "can't see other's sales" do
    s = Factory(:shop)
    s1 = Factory(:sale, :shop => Factory(:shop))
    
    assert !(s.sales.include? s1)
  end
  
  test "can have products" do
    s = Factory(:shop)
    p1 = Factory(:product, :shop => s)
    
    assert s.products.include? p1
  end
  
  test "can't see other's products" do
    s = Factory(:shop)
    p1 = Factory(:product, :shop => Factory(:shop))
    
    assert !(s.products.include? p1)
  end
  
end