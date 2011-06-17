class AddDeleteFlagToInfoSection < ActiveRecord::Migration
  def self.up
    add_column :info_sections, :marked_deleted, :boolean, :default => false 
  end

  def self.down
    remove_column :info_sections, :marked_deleted
  end
end
