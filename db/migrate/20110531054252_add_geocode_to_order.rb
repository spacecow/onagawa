class AddGeocodeToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :latitude, :float
    add_column :orders, :longitude, :float
  end

  def self.down
    remove_column :orders, :longitude
    remove_column :orders, :latitude
  end
end
