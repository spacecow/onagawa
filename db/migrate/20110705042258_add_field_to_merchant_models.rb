class AddFieldToMerchantModels < ActiveRecord::Migration
  def self.up
    add_column :order_transactions, :test, :boolean
    rename_column :order_transactions, :purchase_id, :order_id 
    add_column :orders, :description, :string
    rename_column :orders, :quantity, :amount
    add_column :orders, :aasm_state, :string
    rename_column :order_transactions, :authorization, :reference
  end

  def self.down
    remove_column :order_transactions, :test
    rename_column :order_transactions, :order_id, :purchase_id
    remove_column :orders, :description    
    rename_column :orders, :amount, :quantity
    remove_column :orders, :aasm_state
    rename_column :order_transactions, :reference, :authorization 
  end
end
