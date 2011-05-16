class PaymentNotification < ActiveRecord::Base
  belongs_to :order
  attr_accessible :params, :order_id, :status, :transaction_id
  serialize :params
  #after_create :mark_order_as_purchased

  private

    def mark_order_as_purchased
      if status == "Completed"
        order.update_attributes(:purchased_at => Time.now)
      end
    end
end

# == Schema Information
#
# Table name: payment_notifications
#
#  id             :integer(4)      not null, primary key
#  params         :text
#  order_id       :integer(4)
#  status         :string(255)
#  transaction_id :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

