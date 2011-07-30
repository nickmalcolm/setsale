class CreateDiscounts < ActiveRecord::Migration
  def self.up
    create_table :discounts do |t|
      t.integer :product_id
      t.integer :shop_id
      t.integer :sale_id

      t.timestamps
    end
  end

  def self.down
    drop_table :discounts
  end
end
