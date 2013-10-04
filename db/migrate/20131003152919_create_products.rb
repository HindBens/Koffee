class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price_in_pence
      t.boolean :is_live, default: true

      t.timestamps
    end

    add_attachment :products, :image
  end
end
