class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :product_name
      t.integer :price
      t.string :company
      t.string :color

      t.timestamps
    end
  end
end
