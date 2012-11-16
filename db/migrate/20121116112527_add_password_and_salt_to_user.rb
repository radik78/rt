class AddPasswordAndSaltToUser < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_pass, :string
    add_column :users, :salt, :string
  end
end
