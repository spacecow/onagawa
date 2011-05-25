class CreateInfoSections < ActiveRecord::Migration
  def self.up
    create_table :info_sections do |t|
      t.string :title
      t.integer :pos
      t.timestamps
    end
  end

  def self.down
    drop_table :info_sections
  end
end
