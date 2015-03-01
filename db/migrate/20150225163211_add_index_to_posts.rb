class AddIndexToPosts < ActiveRecord::Migration
  def self.up
    add_index :posts, :pain_level
    add_index :posts, :created_at
  end

  def self.down
    remove_index :posts, :pain_level
    remove_index :posts, :created_at
  end
end
