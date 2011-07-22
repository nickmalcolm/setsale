class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      
      t.string    :handle
      t.string    :product_type
      t.text      :body_html
      t.string    :title
      t.string    :tags
      t.datetime :published_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
