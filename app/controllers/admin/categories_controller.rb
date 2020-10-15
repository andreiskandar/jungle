class Admin::CategoriesController < ApplicationController
  # for final project 
  # def index
  #   render json: Category.all, only: [:id, :name ]
  # end

  def index
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end


end
