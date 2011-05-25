class InfoSection < ActiveRecord::Base
  has_many :info_subsections

  attr_accessible :title, :pos
end
