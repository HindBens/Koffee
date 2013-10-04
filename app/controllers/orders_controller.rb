class OrdersController < ApplicationController
  def index
  	#list of past orders user has

    if current_user.present?
      @orders = current_user.orders.all?
    else
      flash[:error] = "You must be signed in"
      redirect_to root_path
    end
  end

  def show
  	#be a thanks page, this is your order
    @order = Order.find(params[:id])
  end

  def new
  	#place an order form
  	@order = Order.new
  	@order = build_order(@order)

    if current_user.present?
      @order.name = current_user.name
      @order.email = current_user.email
  end
end

  def create
  	#process payment and redirect to the show page
@order = Order.new(order_params)
@order = build_order(@order)

if current_user.present?
  @order.user = current_user
end

if @order.save

  Stripe::Charge.create(amount: @order.total_price, currency: "GBP", 
    card: @order.stripe_token, description:"Order number #{@order.id} - #{@order.email}")
	basket.clear
	flash[:success] = "Thanks for ordering"
	redirect_to order_path(@order)
else
	render "new"
  end
end

  private

  def order_params
    params.require(:order).permit(:name, :email, :Address_1, :Address_2, :city, :country, :post_code, :stripe_token)
  end
  def build_order(o)
  	#add all the session basket products to the order itself
  	basket.each do |basket_item|
  		@product = Product.find(basket_item)

  		#on this order "o", add that product
  		o.order_products.build(product_id: @product.id, quantity: 1, price_in_pence: @product.price_in_pence)

  	end
  	return o



  end

end
