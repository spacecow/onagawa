class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.integer :quantity
      t.string :card_type
      t.date :card_expires_on
      t.datetime :purchased_at

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
