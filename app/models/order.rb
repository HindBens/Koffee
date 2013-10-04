class Order < ActiveRecord::Base

	has_many :order_products
	belongs_to :user

	validates :name, presence: true
	validates :email, presence: true
	validates :Address_1, presence: true
	validates :post_code, presence: true
	validates :stripe_token, presence: true

	def total_price
		#local variable
		t= 0

		self.order_products.each do |p|
			t += p.price_in_pence
		end

		return t
		
	end
	
end
