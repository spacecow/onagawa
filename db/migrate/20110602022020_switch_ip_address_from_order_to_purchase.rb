class SwitchIpAddressFromOrderToPurchase < ActiveRecord::Migration
  def self.up
    add_column :purchases, :ip_address, :string
    remove_column :orders, :ip_address
  end

  def self.down
    add_column :orders, :ip_address, :string
    remove_column :purchases, :ip_address
  end
end
