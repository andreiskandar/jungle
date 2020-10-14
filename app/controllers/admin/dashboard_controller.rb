class Admin::DashboardController < ApplicationController
  def show
    @products = Product.all.order(created_at: :desc)  
    @categories = Category.all
  end
end
