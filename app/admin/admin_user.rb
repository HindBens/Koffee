ActiveAdmin.register AdminUser do
  index do
    id_column
    column :title
    column :price_in_pence
    column :is_live
    default_actions
  end


  form do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :description
      f.input :image
      f.input :price_in_pence
      f.input :is_live
    end
    f.actions
    
  end
  controller do
    def permitted_params
      params.permit admin_user: [:email, :password, :password_confirmation]
    end
  end
end
