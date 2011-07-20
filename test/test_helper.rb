ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  
  def login_as(shop)
    @request.session[:shopify] = ShopifyAPI::Session.new(shop.domain, 'somerandomtoken')
    @request.session[:shop_id] = shop.id
  end
  
end
