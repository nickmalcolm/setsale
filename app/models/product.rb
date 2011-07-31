class Product < ActiveRecord::Base
  
  belongs_to :shop
  
  has_many :discounts
  has_many :sales, :through => :discounts
  
  validates_presence_of :shop
  validates_presence_of :shopify_id
  
  attr_accessible :handle, :product_type, :body_html, :title, :tags, :published_at, :shop, :shopify_id
  
  
  def self.new_from_shopify(shop, attributes)
    product = Product.new(:shop => shop)
    product.attributes = attributes
    product.shopify_id = attributes["id"]
    product
  end
  
end
