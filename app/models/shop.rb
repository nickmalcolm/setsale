class Shop < ActiveRecord::Base
  
  validates_presence_of :domain
  
  def site
    "https://"+ShopifyAPI::Session.api_key+":"+api_password+"@"+domain+"/admin"
  end
  
  def shopify_admin_url
    "https://"+domain+"/admin"
  end
  
  def shopify_api_connection
    ShopifyAPI::Base.site = self.site
  end
  
  def init_from_shopify
    shopify_api_connection
    shopify_shop = ShopifyAPI::Shop.current
    
    self.currency = shopify_shop.currency
    self.money_with_currency_format = shopify_shop.money_with_currency_format
    save!
  end
  
end