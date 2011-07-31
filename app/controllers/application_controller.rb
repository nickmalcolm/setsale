class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def shopify_session
    if session[:shopify]
      begin
        # session[:shopify] set in LoginController#finalize
        ShopifyAPI::Base.site = session[:shopify].site
        Time.zone = current_shop.timezone[12..-1]
        yield
      ensure 
        ShopifyAPI::Base.site = nil
      end
    else
      session[:return_to] = request.fullpath
      flash[:error] = "You need to log in"
      redirect_to login_path
    end
  end
  
  def current_shop
    Shop.find_by_domain(session[:shopify].url) unless session[:shopify].nil?
  end
end
