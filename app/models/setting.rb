class Setting < ActiveRecord::Base
  attr_accessible :contact_info, :contact_info_ja
end

# == Schema Information
#
# Table name: settings
#
#  id              :integer(4)      not null, primary key
#  prefix          :string(255)
#  contact_info    :string(255)
#  contact_info_ja :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

