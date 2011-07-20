class AddNameToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :name, :string
  end

  def self.down
    remove_column :sales, :name
  end
end
