class CategoriesController  < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products
    @product_reviews = @category.products.limit(8)
    @authors = @product_reviews.pluck(:authors).uniq.take(5)

    @products = @products.limit(params[:display_select]) if params[:display_select].present?
    display_select = params[:display_select].presence || 4
    @products = @products.page(params[:page]).per(display_select)

    case params[:sort_select].presence
    when 1.to_s
      @products = @products.order(updated_at: :desc)
    when 2.to_s
      @products = @products.order(price_has_dropped: :asc)
    when 3.to_s
      @products = @products.order(price_has_dropped: :desc)
    else
      @products = @products.order(updated_at: :desc)
    end
  end
end