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
  
end