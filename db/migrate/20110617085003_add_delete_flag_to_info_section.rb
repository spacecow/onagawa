class AddDeleteFlagToInfoSection < ActiveRecord::Migration
  def self.up
    add_column :info_sections, :deleted, :boolean
  end

  def self.down
    remove_column :info_sections, :deleted
  end
end
