class CreateInfoSubsections < ActiveRecord::Migration
  def self.up
    create_table :info_subsections do |t|
      t.integer :info_section_id
      t.text :content
      t.integer :pos
      t.string :filename
      t.timestamps
    end
  end

  def self.down
    drop_table :info_subsections
  end
end
