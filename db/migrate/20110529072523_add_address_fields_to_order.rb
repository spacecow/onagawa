class AddAddressFieldsToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :country, :string
    add_column :orders, :city, :string
    add_column :orders, :address, :string
    add_column :orders, :zipcode, :string
    add_column :orders, :email, :string
    add_column :orders, :phone, :string
    remove_column :orders, :quantity
    remove_column :orders, :card_type
    remove_column :orders, :card_expires_on
    remove_column :orders, :purchased_at
  end

  def self.down
    remove_column :orders, :phone
    remove_column :orders, :email
    remove_column :orders, :zipcode
    remove_column :orders, :address
    remove_column :orders, :city
    remove_column :orders, :country
    add_column :orders, :quantity, :integer
    add_column :orders, :card_type, :string
    add_column :orders, :card_expires_on, :date
    add_column :orders, :purchased_at, :datetime
  end
end
