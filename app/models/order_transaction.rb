class OrderTransaction < ActiveRecord::Base
  belongs_to :order
  serialize :params

  def response=(response)
    self.success       = response.success?
    self.authorization = response.authorization
    self.message       = response.message
    self.params        = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
  end
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

