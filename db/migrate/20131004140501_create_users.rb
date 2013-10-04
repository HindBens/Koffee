class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :provider_id
      t.string :name
      t.string :email
      t.string :image

      t.timestamps
    end
  end
end
