class RenameOrdersToProfiles < ActiveRecord::Migration
  def self.up
    rename_table :orders, :profiles
  end

  def self.down
    rename_table :profiles, :orders
  end
end
