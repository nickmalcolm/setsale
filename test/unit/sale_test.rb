require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  
  def setup
    @blank = Sale.new
  end
  
  test "can create sale" do
    assert @blank.valid?
  end
  
  test "sale needs start date" do
    @blank.starts_at = Time.now
    assert @blank.valid?
  end
  
end