class Sale < ActiveRecord::Base
  
  AMOUNT_TYPES = %w(fixed percentage)
  
  belongs_to :shop
  
  has_many :discounts
  has_many :products, :through => :discounts
  
  validates_presence_of :shop
  validates_presence_of :starts_at
  validates_presence_of :ends_at
  validates_numericality_of :amount
  validates_inclusion_of :amount_type, :in => AMOUNT_TYPES
  
  attr_accessible :name, :starts_at, :ends_at, :amount, :amount_type, :product_ids
  
  accepts_nested_attributes_for :products, :discounts
  
end