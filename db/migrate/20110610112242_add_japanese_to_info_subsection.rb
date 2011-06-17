class AddJapaneseToInfoSubsection < ActiveRecord::Migration
  def self.up
    add_column :info_subsections, :content_ja, :string
  end

  def self.down
    remove_column :info_subsections, :content_ja
  end
end
