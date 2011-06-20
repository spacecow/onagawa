class InfoSubsection < ActiveRecord::Base
  include Unicoder

  belongs_to :info_section

  attr_accessible :content_key, :info_section, :content_en, :pos, :filename, :content_ja

  validates :pos, :presence => true, :uniqueness => {:scope => :info_section_id}
  validates :filename, :presence => true

  after_save :save_content_to_redis

  def content; I18n.t(content_key) end
  def content_en; @content_en || unicode($redis["en."+self.content_key]) end
  def content_en=(s); @content_en = s end
  def content_ja; @content_ja || unicode($redis["ja."+self.content_key]) end
  def content_ja=(s); @content_ja = s end

  def get_content(english); english ? content : content_ja end
  def file
    return "#{filename}.png" unless filename.blank?
    "#{info_section_title.downcase}#{pos}.png"
  end
  def file_colour
    return "#{filename}colour.png" unless filename.blank?
    "#{info_section_title.downcase}#{pos}colour.png"
  end
  def file_thumb
    return "#{filename}thumb.png" unless filename.blank?
    "#{info_section_title.downcase}#{pos}thumb.png"
  end

  private
    def info_section_title; info_section.title end
    def save_content_to_redis
      $redis["en."+content_key] = '"'+content_en+'"'
      $redis["ja."+content_key] = '"'+content_ja+'"'
    end
end




# == Schema Information
#
# Table name: info_subsections
#
#  id              :integer(4)      not null, primary key
#  info_section_id :integer(4)
#  pos             :integer(4)
#  filename        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  content_key     :string(255)
#

