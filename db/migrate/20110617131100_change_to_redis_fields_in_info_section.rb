class ChangeToRedisFieldsInInfoSection < ActiveRecord::Migration
  def self.up
    remove_column :info_subsections, :content
    remove_column :info_subsections, :content_ja
  end

  def self.down
    add_column :info_subsections, :content, :string
    add_column :info_subsections, :content_ja, :string
  end
end
