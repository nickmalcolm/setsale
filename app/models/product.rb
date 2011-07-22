class Product < ActiveRecord::Base
  
  belongs_to :shop
  
  validates_presence_of :shop
  
  attr_accessible :handle, :product_type, :body_html, :title, :tags, :published_at, :shop
  
end
