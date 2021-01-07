class Admin::DashboardController < ApplicationController
 
  before_filter :authorize
  
  def show
    @products = Product.all.count
    @categories = Category.all.count
  end
end
