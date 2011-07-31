class Shop < ActiveRecord::Base
  
  validates_presence_of :domain
  
  has_many :sales
  has_many :products
  
  def site
    "https://"+ShopifyAPI::Session.api_key+":"+api_password+"@"+domain+"/admin"
  end
  
  def shopify_admin_url
    "https://"+domain+"/admin"
  end
  
  def shopify_api_connection
    ShopifyAPI::Base.site = self.site
  end
  
  def update_from_shopify
    shopify_api_connection
    shopify_shop = ShopifyAPI::Shop.current
    
    self.currency = shopify_shop.currency
    self.money_with_currency_format = shopify_shop.money_with_currency_format
    self.timezone = shopify_shop.timezone
    save!
  end
  
end