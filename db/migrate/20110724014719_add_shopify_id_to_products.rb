class AddShopifyIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :shopify_id, :integer
  end

  def self.down
    remove_column :products, :shopify_id
  end
end
