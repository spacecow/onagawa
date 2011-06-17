class InfoSubsection < ActiveRecord::Base
  belongs_to :info_section

  attr_accessible :info_section, :content, :pos, :filename, :content_ja

  validates :pos, :presence => true, :uniqueness => {:scope => :info_section_id}
  validates :filename, :presence => true

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
end


# == Schema Information
#
# Table name: info_subsections
#
#  id              :integer(4)      not null, primary key
#  info_section_id :integer(4)
#  content         :text
#  pos             :integer(4)
#  filename        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  content_ja      :string(255)
#

