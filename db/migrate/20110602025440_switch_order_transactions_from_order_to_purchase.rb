class SwitchOrderTransactionsFromOrderToPurchase < ActiveRecord::Migration
  def self.up
    remove_column :order_transactions, :order_id
    add_column :order_transactions, :purchase_id, :integer
  end

  def self.down
    remove_column :order_transactions, :purchase_id
    add_column :order_transactions, :order_id, :integer
  end
end
