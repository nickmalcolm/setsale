class AddCurrencyAndCurrencyFormatToShops < ActiveRecord::Migration
  def self.up
    add_column :shops, :currency, :string, :default => "USD"
    add_column :shops, :money_with_currency_format, :string, :default => "${{amount}} USD"
  end

  def self.down
    remove_column :shops, :money_with_currency_format
    remove_column :shops, :currency
  end
end
