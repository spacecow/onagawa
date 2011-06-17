class AddDeleteFlagToInfoSection < ActiveRecord::Migration
  def self.up
    add_column :info_sections, :marked_deleted, :integer, :default => 0
  end

  def self.down
    remove_column :info_sections, :deleted
  end
end
