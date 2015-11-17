class AddPasswordDigestToPerson < ActiveRecord::Migration
  def change
    add_column :people, :password_digest, :string
  end
end
