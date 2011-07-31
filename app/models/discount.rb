class Discount < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :shop
  belongs_to :sale
  
  validates_presence_of :shop
  validates_presence_of :product
  validates_presence_of :sale
  
  attr_accessible :product_id, :sale_id
  
  before_validation :set_shop
  
  private
  def set_shop
    self.shop_id = self.product.shop_id
  end
  
end
