class Message < ActiveRecord::Base
  attr_accessible :name, :email, :content
 
  validates :name, :presence => true
  validates :email, :presence => true
  validates :content, :presence => true
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

