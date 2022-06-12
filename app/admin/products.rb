ActiveAdmin.register Product do
  permit_params :category_id, :Url, :Title, :Publication_year, :Authors, :Description, :Main_image, :Price, :Discount, :Final_price, :Amount, :Stop_business

  controller do
    def create
      @product = Product.new(permitted_params[:product])

      if @product.save
        redirect_to @product
      end
    end
  end

  
end
