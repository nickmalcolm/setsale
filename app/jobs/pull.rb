#A resque job to pull whatever object you like from Shopify
#Requires a local model with the same name, and matching
# attribute names if you want to automatically get those
# from Shopify.

class Pull
  @queue = :shopify
  
  def self.perform(class_name, shop_id)
    
    #Throw an NameError nice and early if class_name
    # isn't a supported class
    klass = Kernel.const_get(class_name)
    ShopifyAPI.const_get(class_name)
    
    #Get the shop and get ready to rumble
    shop = Shop.find(shop_id)
    ShopifyAPI::Base.site = shop.site
    
    puts "Pulling #{class_name} for #{shop.domain}"
    
    page = 1
    #Loop until we've pulled all of Shopify's klass
    loop do
      objects = ShopifyAPI.const_get(class_name).find(:all, :params => {:limit => 250, :page => page })
      
      objects.each do |shopify_obj|
        print "."
        shopify_id = shopify_obj.attributes["id"]
        
        #Make sure we don't duplicate objects
        obj = klass.find_by_shopify_id(shopify_id) || klass.new(:shop => shop, :shopify_id => shopify_id)
        
        #Add attributes to our object
        obj.attributes = shopify_obj.attributes
        
        obj.save!
      end
      
      page += 1
      
      break if objects.empty?
    end
    puts "\nDone!"
  end
end