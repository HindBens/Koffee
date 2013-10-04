class BasketsController < ApplicationController

def create
	#add this product to the basket
	#find the product then add it to basket and tell user
	@product = Product.find(params[:product_id])
	basket.add(@product.id)
	flash[:success] = "Item added to the basket"
	redirect_to product_path(@product)
end

def destroy
	#remove this product from the basket
	@product = Product.find(params[:product_id])
	basket.delete(@product.id)
	flash[:success] = "Item removed from basket"
	redirect_to product_path(@product)
	end

end
