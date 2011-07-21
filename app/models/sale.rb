class Sale < ActiveRecord::Base
  
  validates_presence_of :starts_at
  validates_presence_of :ends_at
  
  attr_accessible :starts_at, :ends_at
  
end