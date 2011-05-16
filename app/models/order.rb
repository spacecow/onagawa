class Order < ActiveRecord::Base
  attr_accessible :quantity

  def paypal_url(quantity, return_url, notify_url)
  values = {
    :business => 'seller_1305516847_biz@gmail.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id,
    :notify_url => notify_url
  }
  index = 0
  values.merge!({
    "amount_#{index+1}" => "10",
    "item_name_#{index+1}" => "onagawaFISH",
    "item_number_#{index+1}" => "1",
    "quantity_#{index+1}" => quantity 
  })
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end


end

# == Schema Information
#
# Table name: orders
#
#  id              :integer(4)      not null, primary key
#  cart_id         :integer(4)
#  ip_address      :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  card_type       :string(255)
#  card_expires_on :date
#  created_at      :datetime
#  updated_at      :datetime
#

