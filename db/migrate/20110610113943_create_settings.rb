class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :prefix
      t.string :contact_info
      t.string :contact_info_ja

      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
