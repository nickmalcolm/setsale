class SalesController < ApplicationController
  
  around_filter :shopify_session
  
  before_filter :get_products, :only => [:new, :edit]
  
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
    @selected_products = []
  end

  def create
    @sale = Sale.new(params[:sale])
    @sale.shop = current_shop
    if @sale.save
      redirect_to @sale, :notice => "Successfully created sale."
    else
      render :action => 'new'
    end
  end

  def edit
    @sale = Sale.find(params[:id])
    @selected_products = @sale.discounts.map(&:product_id)
  end

  def update
    @sale = Sale.find(params[:id])
    product_ids = (params[:sale][:product_ids] - [""]).map(&:to_i)
    params[:sale][:product_ids] = nil
    product_ids.each {|pid| params.merge!(:discounts => [{:shop_id => current_shop.id, :product_id => pid, :sale_id => @sale.id}])}
    
    p params
    
    if @sale.update_attributes(params[:sale])
      redirect_to @sale, :notice  => "Successfully updated sale."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to sales_url, :notice => "Successfully destroyed sale."
  end
  
  private
  
  def get_products
    @products = current_shop.products
  end
  
end
