class AddNewTableForPosts < ActiveRecord::Migration
  def self.up
    create_table :characteristics do |t|
      t.column :description_id, :integer
      t.column :post_id, :integer
    end
    create_table :bodyparts do |t|
      t.column :name, :string
    end
  end

  def self.down
    drop_table :characteristics
    drop_table :bodyparts
  end
end
