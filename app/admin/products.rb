ActiveAdmin.register Product do
  permit_params :category_id, :title, :publication_year, :publication_company, :authors, :translator, :description, :price,
                :discount, :height, :width, :weight, :layout, :number_page, :stop_business

  form do |f|
    f.inputs do
      f.input :category_id, label: 'Category', as: :select, :collection => Category.category_childs
      f.input :title
      f.input :publication_year
      f.input :publication_company
      f.input :authors
      f.input :translator
      f.input :description
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :price
      f.input :discount
      f.input :height
      f.input :width
      f.input :weight
      f.input :layout
      f.input :number_page
      f.input :stop_business, as: :boolean
    end
    f.actions
  end

  controller do
    def create
      @product = Product.new(permitted_params[:product])

      if @product.save
        redirect_to admin_products_path
      end
    end
  end

  
end
