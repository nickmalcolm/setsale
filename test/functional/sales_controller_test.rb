require 'test_helper'
require 'mocha'

class SalesControllerTest < ActionController::TestCase
  
  test "redirect when logged out" do
    get :index
    assert_redirected_to login_path
  end
  
end

class LoggedInSalesControllerTest < ActionController::TestCase
  tests SalesController
  
  def setup
    @shop = Factory(:shop)
    @sale = Factory(:sale, :shop => @shop)
    login_as @shop
  end

  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => @sale.to_param
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_valid_without_products
    post :create, :sale => @sale.attributes
    assert_redirected_to sale_url(assigns(:sale))
  end
  
  test "create valid with products" do
    p1 = Factory(:product, :shop => @shop)
    assert_difference "Discount.count" do
      put :create, :sale => @sale.attributes.merge(:product_ids => [p1.id])
    end
    
    d = Discount.last
    assert_equal @shop, d.shop
    assert_equal Sale.last, d.sale
    assert_equal p1, d.product
  end

  def test_edit
    get :edit, :id => @sale.to_param
    assert_template 'edit'
  end

  def test_update_valid
    put :update, :id => @sale.to_param
    assert_redirected_to sale_url(assigns(:sale))
  end

  def test_destroy
    assert_difference "Sale.count", -1 do
      delete :destroy, :id => @sale
      assert_redirected_to sales_url
    end
    assert !Sale.exists?(@sale)
  end
  
  test "can see products in form" do
    5.times {Factory(:product, :shop => @shop)}
    get :edit, :id => @sale.to_param
    assert_select "#products"
    assert_select ".product", 5
  end
  
  test "can create discounts through form" do
    p1 = Factory(:product, :shop => @shop)
    assert_difference "Discount.count" do
      put :update, :id => @sale.to_param, :sale => @sale.attributes.merge(:product_ids => [p1.id])
    end
    
    d = Discount.last
    assert_equal @shop, d.shop
    assert_equal @sale, d.sale
    assert_equal p1, d.product
  end
  
  test "cant have discount with different shop's products" do
    p1 = Factory(:product, :shop => Factory(:shop))
    
    assert_raises ActiveRecord::RecordInvalid do
      put :update, :id => @sale.to_param, :sale => @sale.attributes.merge(:product_ids => [p1.id])
    end
  end
  
  test "can remove discounts" do
    @sale.products << Factory(:product, :shop => @shop)
    assert_difference "Discount.count", -1 do
      put :update, :id => @sale.to_param, :sale => @sale.attributes.merge(:product_ids => [])
    end
    
    assert @sale.discounts.empty?
    assert @sale.products.empty?
  end
  
end
