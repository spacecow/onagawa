class Cart < ActiveRecord::Base
  has_one :order
end

# == Schema Information
#
# Table name: carts
#
#  id           :integer(4)      not null, primary key
#  purchased_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

