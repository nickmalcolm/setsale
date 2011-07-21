require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  
  def setup
    @blank = Sale.new
  end
  
  test "blank sale invalid" do
    assert @blank.invalid?
  end
  
  test "sale needs start date" do
    @blank.starts_at = Time.now
    assert @blank.valid?
  end
  
end