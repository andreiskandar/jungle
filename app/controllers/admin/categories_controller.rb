class Admin::CategoriesController < ApplicationController
  # for final project 
  # def index
  #   render json: Category.all, only: [:id, :name ]
  # end

  def index
    @categories = Category.all 
    @products =  []
    @categories.each do |category|
      @products.push(category.products)
    end
  end

  def new
    @category = Category.new
  end
  


end
