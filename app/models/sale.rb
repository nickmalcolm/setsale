class Sale < ActiveRecord::Base
  
  AMOUNT_TYPES = %w(fixed percentage)
  
  validates_presence_of :starts_at
  validates_presence_of :ends_at
  validate :amount, :presence => true, :numericality => true, :allow_nil => false
  validates_inclusion_of :amount_type, :in => AMOUNT_TYPES
  
  attr_accessible :starts_at, :ends_at, :amount, :amount_type
  
end