class AddCreatedOnToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :created_on, :date
  end
end
