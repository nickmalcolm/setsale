class AddAmountTypeToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :amount_type, :string
  end

  def self.down
    remove_column :sales, :amount_type
  end
end
