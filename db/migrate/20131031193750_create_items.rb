class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :content
      t.integer :user_id
      t.string :item_type
      t.integer :relation_id
      t.integer :wall_owner_id

      t.timestamps
    end
  end
end
