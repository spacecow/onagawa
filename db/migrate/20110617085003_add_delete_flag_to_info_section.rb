class AddDeleteFlagToInfoSection < ActiveRecord::Migration
  def self.up
    add_column :info_sections, :deleted, :boolean, :default => false
  end

  def self.down
    remove_column :info_sections, :deleted
  end
end
