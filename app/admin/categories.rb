ActiveAdmin.register Category do
  permit_params :name, :role, :category_id

  form do |f|
    f.inputs do
      f.input :category_id, label: 'Category', as: :select, :collection => Category.category_parents
      f.input :name
      f.input :role
    end
    f.actions
  end

  controller do 
    def create
      @category = Category.new(permitted_params[:category])
      
      if @category.save
        redirect_to admin_categories_path
      end
    end
  end
  
end
