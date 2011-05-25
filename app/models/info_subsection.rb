class InfoSubsection < ActiveRecord::Base
  belongs_to :info_section

  attr_accessible :info_section, :content, :pos
end
