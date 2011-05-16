class Order < ActiveRecord::Base
  belongs_to :cart

  attr_accessor :card_number, :card_verification
  attr_accessible :cart_id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on

  def paypal_url(return_url)
  values = {
    :business => 'seller_1305516847_biz@gmail.com',
    :cmd => '_order',
    :upload => 1,
    :return => return_url,
    :invoice => id
  }
  index = 0
  values.merge!({
    "amount_#{index+1}" => "3000",
    "item_name_#{index+1}" => "onagawaFISH",
    "item_number_#{index+1}" => "1",
    "quantity_#{index+1}" => "1"
  })
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end


end
