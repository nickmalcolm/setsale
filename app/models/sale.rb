class Sale < ActiveRecord::Base
  
  AMOUNT_TYPES = %w(fixed percentage)
  
  belongs_to :shop
  
  has_many :products
  
  validates_presence_of :shop
  validates_presence_of :starts_at
  validates_presence_of :ends_at
  validates_numericality_of :amount
  validates_inclusion_of :amount_type, :in => AMOUNT_TYPES
  
  attr_accessible :starts_at, :ends_at, :amount, :amount_type
  
end