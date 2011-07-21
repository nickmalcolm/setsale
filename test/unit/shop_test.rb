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
  
end