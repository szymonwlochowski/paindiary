class AddNewFieldsForUser < ActiveRecord::Migration
  def change
  	add_column :users, :city, :string
  	add_column :users, :sex, :boolean
  	add_column :users, :about, :text
  end
end
