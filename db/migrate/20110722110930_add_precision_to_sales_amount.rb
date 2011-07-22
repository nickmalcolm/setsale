class AddPrecisionToSalesAmount < ActiveRecord::Migration
  def self.up
    change_column :sales, :amount, :decimal, :precision => 16, :scale => 2
  end

  def self.down
    change_column :sales, :amount, :decimal, :precision => 10, :scale => 0
  end
end
