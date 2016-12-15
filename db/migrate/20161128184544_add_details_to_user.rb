class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_reference :users, :church, index: true, foreign_key: true
    add_column :users, :phone_numer, :string
    add_column :users, :picture, :binary
  end
end
