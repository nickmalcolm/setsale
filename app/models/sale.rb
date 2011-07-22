class Sale < ActiveRecord::Base
  
  validates_presence_of :starts_at
  validates_presence_of :ends_at
  validate :amount, :presence => true, :numericality => true, :allow_nil => false
  
  attr_accessible :starts_at, :ends_at, :amount
  
end