class AddNewFieldsForPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :pain_level, :integer
  	add_column :posts, :description, :text
  	add_column :posts, :time, :datetime
  	add_column :posts, :comments, :text
  	add_column :posts, :meds, :text
  	add_column :posts, :non_drugs, :text
  end
end