class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.datetime :reviewdate
      t.text :comments
      t.integer :rating

      t.timestamps
    end
  end
end
