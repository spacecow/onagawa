class ChangeToRedisFieldsInInfoSection < ActiveRecord::Migration
  def self.up
    add_column :info_subsections, :content_key, :string  
    remove_column :info_subsections, :content
    remove_column :info_subsections, :content_ja
  end

  def self.down
    remove_column :info_subsections, :content_key
    add_column :info_subsections, :content, :string
    add_column :info_subsections, :content_ja, :string
  end
end
