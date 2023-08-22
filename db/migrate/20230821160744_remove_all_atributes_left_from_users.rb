class RemoveAllAtributesLeftFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_columns(:users, :city, :birth, :country, :gender, :role)
  end
end
