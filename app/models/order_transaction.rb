class OrderTransaction < ActiveRecord::Base
  belongs_to :purchase
  serialize :params

  class << self
    def authorize(amount, credit_card, options = {})
      process('authorization', amount) do |gw|
      end
    end
  end

  def process(action, amount=nil)
    result = OrderTransaction.new
    result.amount      = amount
    result.action      = action

    begin
      response         = yield gateway

      response.success       = response.success?
      response.reference     = response.authorization
      response.message       = response.message
      response.params        = response.params
      response.test          = response.test?
    rescue ActiveMerchant::ActiveMerchantError => e
      response.success       = false
      response.reference     = nil
      response.message       = e.message
      response.params        = {}
      response.test          = gateway.test?
    end
    result
  end
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

