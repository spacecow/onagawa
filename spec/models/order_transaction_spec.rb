require 'spec_helper'

describe OrderTransaction do
end


# == Schema Information
#
# Table name: order_transactions
#
#  id            :integer(4)      not null, primary key
#  action        :string(255)
#  amount        :integer(4)
#  success       :boolean(1)
#  authorization :string(255)
#  message       :string(255)
#  params        :text
#  created_at    :datetime
#  updated_at    :datetime
#  purchase_id   :integer(4)
#

