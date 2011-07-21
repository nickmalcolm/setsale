class AddStartAndEndTimeToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :starts_at, :datetime
    add_column :sales, :ends_at, :datetime
  end

  def self.down
    remove_column :sales, :ends_at
    remove_column :sales, :starts_at
  end
end
