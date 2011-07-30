require 'test_helper'

class DiscountTest < ActiveSupport::TestCase
  
  test "discount needs shop, sale and product" do
    assert Factory.build(:discount, :shop => nil).invalid?
    assert Factory.build(:discount, :sale => nil).invalid?
    assert Factory.build(:discount, :product => nil).invalid?
  end
  
  test "factory works" do
    assert Factory(:discount).valid?
  end
  
end
