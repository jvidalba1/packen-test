class AddConditionIdToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :condition_id, :integer, null: true
  end
end
