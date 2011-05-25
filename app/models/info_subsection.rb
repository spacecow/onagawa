class InfoSubsection < ActiveRecord::Base
  belongs_to :info_section

  attr_accessible :info_section, :content, :pos, :filename

  def file
    return "#{filename}.png" if filename
    "#{info_section_title}#{pos}.png"
  end
  def file_colour
    return "#{filename}colour.png" if filename
    "#{info_section_title}#{pos}colour.png"
  end
  def file_thumb
    return "#{filename}thumb.png" if filename
    "#{info_section_title}#{pos}thumb.png"
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
#

