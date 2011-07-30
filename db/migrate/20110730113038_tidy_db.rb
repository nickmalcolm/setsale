class TidyDb < ActiveRecord::Migration
  def self.up
    drop_table :discounted_products
  end

  def self.down
  end
end
