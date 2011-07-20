require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  
  test "invalid without domain" do
    assert Shop.new.invalid?
  end
  
  test "valid with domain" do
    assert Shop.new(:domain => "bob.com").valid?
  end
  
end