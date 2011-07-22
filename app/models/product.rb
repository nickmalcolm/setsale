class Product < ActiveRecord::Base
  
  attr_accessible :handle, :product_type, :body_html, :title, :tags, :published_at
  
end
