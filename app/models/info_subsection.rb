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

  private
    def info_section_title; info_section.title end
end
