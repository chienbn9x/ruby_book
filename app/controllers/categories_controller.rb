class CategoriesController  < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.limit(8)
    @authors = @products.pluck(:authors).uniq.take(5)
  end
end