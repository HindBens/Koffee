class Product < ActiveRecord::Base

	has_many :order_products
	validates :title, presence: true
	validates :description, presence: true
	validates :price_in_pence, presence: true

	has_attached_file :image, styles: {
		large: "960x300#",
		medium: "400x400#",
		small: "200x200#"
	}
end
