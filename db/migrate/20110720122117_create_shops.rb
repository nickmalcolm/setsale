class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.integer :shopify_id
      t.string :domain
      t.string :api_password

      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end
