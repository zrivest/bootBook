class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.text :interest
      t.integer :cohort_id
      t.datetime :birthdate
      t.timestamps
    end
  end
end
