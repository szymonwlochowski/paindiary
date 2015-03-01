class AddNewFieldForPosts < ActiveRecord::Migration
  def change
    add_column :posts, :bodypart_id, :integer
  end
end
