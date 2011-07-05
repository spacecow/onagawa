class RenamePurchaseToOrder < ActiveRecord::Migration
  def self.up
    rename_table :purchases, :orders
  end

  def self.down
    rename_table :orders, :purchases
  end
end
