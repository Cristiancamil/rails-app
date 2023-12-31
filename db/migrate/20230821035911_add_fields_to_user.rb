class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birth, :date
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :gender, :char
    add_column :users, :role, :integer
  end
end
