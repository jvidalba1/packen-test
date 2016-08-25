class AddSubscriberNumberToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :subscriber_number, :integer
  end
end
