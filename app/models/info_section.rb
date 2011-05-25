class InfoSection < ActiveRecord::Base
  has_many :info_subsections

  attr_accessible :title, :pos
end

# == Schema Information
#
# Table name: info_sections
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  pos        :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

