class AddDebpasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :debpassword, :string
  end
end
