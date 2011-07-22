class AssociateSalesWithShops < ActiveRecord::Migration
  def self.up
    add_column :sales, :shop_id, :integer
  end

  def self.down
    remove_column :sales, :shop_id
  end
end
