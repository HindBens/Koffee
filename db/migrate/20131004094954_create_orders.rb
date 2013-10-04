class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :Address_1
      t.string :Address_2
      t.string :city
      t.string :country
      t.string :stripe_token
      t.string :post_code
      
      t.timestamps
    end
  end
end
