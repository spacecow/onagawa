require 'spec_helper'

describe OrderTransaction do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: order_transactions
#
#  id            :integer(4)      not null, primary key
#  order_id      :integer(4)
#  action        :string(255)
#  amount        :integer(4)
#  success       :boolean(1)
#  authorization :string(255)
#  message       :string(255)
#  params        :text
#  created_at    :datetime
#  updated_at    :datetime
#

