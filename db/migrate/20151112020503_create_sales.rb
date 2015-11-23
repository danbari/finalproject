class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
    t.integer :person_id
    t.integer :product_id
    t.date :saledate
    t.float :saleprice
      t.timestamps
    end
  end
end
