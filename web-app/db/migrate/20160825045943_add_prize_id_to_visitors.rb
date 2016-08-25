class AddPrizeIdToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :prize_id, :integer, null: true
  end
end
