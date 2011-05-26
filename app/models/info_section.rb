class InfoSection < ActiveRecord::Base
  has_many :info_subsections
  accepts_nested_attributes_for :info_subsections, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true
  attr_accessible :title, :info_subsections_attributes

  validates :pos, :uniqueness => true
  validates :title, :presence => true, :uniqueness => true
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

