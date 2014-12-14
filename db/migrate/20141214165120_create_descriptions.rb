class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :name
      t.references :post, index: true
      t.timestamps
    end
  end
end
