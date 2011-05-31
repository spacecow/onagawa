class InfoSection < ActiveRecord::Base
  include PosModel

  has_many :info_subsections, :limit => 4
  accepts_nested_attributes_for :info_subsections, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true

  attr_accessible :title, :info_subsections_attributes

  validates :pos, :uniqueness => true, :presence => true
  validates :title, :presence => true, :uniqueness => true

  def children; info_subsections end
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

