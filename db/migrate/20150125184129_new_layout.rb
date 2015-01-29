class NewLayout < ActiveRecord::Migration
  def self.up
    add_column :users, :layout_name, :string
    add_column :users, :custom_layout, :text
  end

  def self.down
    remove_column :users, :layout_name
    remove_column :users, :custom_layout
  end
end
