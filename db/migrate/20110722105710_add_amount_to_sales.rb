class AddAmountToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :amount, :decimal, :default => 0.00
  end

  def self.down
    remove_column :sales, :amount
  end
end
