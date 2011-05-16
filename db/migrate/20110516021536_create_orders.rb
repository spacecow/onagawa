class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :quantity
      t.datetime :purchased_at
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
