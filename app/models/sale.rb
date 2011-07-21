class Sale < ActiveRecord::Base
  
  validates_presence_of :starts_at
  
end