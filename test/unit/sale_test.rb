require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  
  test "can create sale" do
    assert Sale.new.valid?
  end
  
end