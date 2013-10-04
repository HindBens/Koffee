ActiveAdmin.register Product do
	index do
		id_column
		column :title
		column :price_in_pence
		column :is_live
		default_actions
	end

	form do |f|
		f.inputs "Product details" do
			f.input :title
			f.input :description
			f.input :image
			f.input :price_in_pence
			f.input :is_livebasket 
		end
		f.actions
	end
end
