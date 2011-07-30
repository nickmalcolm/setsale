class Discount < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :shop
  belongs_to :sale
  
  validates_presence_of :shop
  validates_presence_of :product
  validates_presence_of :sale
  
  attr_accessible :shop, :product, :sale
  
end
