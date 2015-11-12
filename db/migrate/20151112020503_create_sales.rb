class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :saledate
      t.float :saleprice

      t.timestamps
    end
  end
end
