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
    @sale = Sale.create!
    login_as Factory(:shop)
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

  def test_create_valid
    post :create, :sale => @sale.attributes
    assert_redirected_to sale_url(assigns(:sale))
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
end
