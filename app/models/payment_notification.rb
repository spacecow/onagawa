class PaymentNotification < ActiveRecord::Base
  belongs_to :cart
  attr_accessible :params, :order_id, :status, :transaction_id
  serialize :params
  after_create :mark_order_as_purchased

  private

    def mark_order_as_purchased
      if status == "Completed"
        order.update_attribute(:purchased_at, Time.now)
      end
    end
end
