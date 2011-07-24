require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "factory works" do
    assert Factory(:product).valid?
  end
  
  test "product invalid without shop" do
    assert Factory.build(:product, :shop => nil).invalid?
  end
  
  test "product invalid without shopify id" do
    assert Factory.build(:product, :shopify_id => nil).invalid?
  end
  
  test "product has shop" do
    shop = Factory(:shop)
    product = Factory(:product, :shop => shop)
    
    assert_equal shop, product.shop
  end
  
  test "import from shopify json works" do
    attributes = {
      "product_type"=> "Cult Products",
      "handle"=> "ipod-nano",
      "created_at"=> "2011-07-11T15:24:08-04:00",
      "body_html"=> "<p>It's the small iPod with one very big idea: Video. Now the world's most popular music player, available in 4GB and 8GB models, lets you enjoy TV shows, movies, video podcasts, and more. The larger, brighter display means amazing picture quality. In six eye-catching colors, iPod nano is stunning all around. And with models starting at just $149, little speaks volumes.</p>",
      "title"=> "IPod Nano - 8GB",
      "template_suffix"=> nil,
      "updated_at"=> "2011-07-11T15:24:08-04:00",
      "id"=> 632910392,
      "tags"=> "Emotive, Flash Memory, MP3, Music",
      "images"=> [],
      "variants"=> [],
      "vendor"=> "Apple",
      "published_at"=> "2007-12-31T19:00:00-05:00",
      "options"=> []
    }
    
    product = Product.new_from_shopify(Factory(:shop), attributes)
    
    assert_equal "IPod Nano - 8GB", product.title
    assert_equal "<p>It's the small iPod with one very big idea: Video. Now the world's most popular music player, available in 4GB and 8GB models, lets you enjoy TV shows, movies, video podcasts, and more. The larger, brighter display means amazing picture quality. In six eye-catching colors, iPod nano is stunning all around. And with models starting at just $149, little speaks volumes.</p>", product.body_html
    assert_equal "Emotive, Flash Memory, MP3, Music", product.tags
    assert_equal "ipod-nano", product.handle
    assert_equal "Cult Products", product.product_type
    assert_equal Time.parse("2007-12-31T19:00:00-05:00").utc, product.published_at
    assert_equal 632910392, product.shopify_id
    
    assert product.save!
    assert product.valid?
  end
    
  
end
