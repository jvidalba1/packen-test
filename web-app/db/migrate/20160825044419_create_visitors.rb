class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :email
      t.integer :subscriber_number
      t.integer :status

      t.timestamps null: false
    end
  end
end
