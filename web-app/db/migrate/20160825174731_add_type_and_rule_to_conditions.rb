class AddTypeAndRuleToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :type_cond, :string
    add_column :conditions, :rule, :string
  end
end
