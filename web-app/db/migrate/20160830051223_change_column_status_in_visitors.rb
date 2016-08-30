class ChangeColumnStatusInVisitors < ActiveRecord::Migration
  def up
    change_column :visitors, :status, :integer, default: 1
  end

  def down
    change_column :visitors, :status, :intger
  end
end
