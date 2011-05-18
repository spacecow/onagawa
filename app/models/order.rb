class Order < ActiveRecord::Base
  has_many :transactions, :class_name => "OrderTransaction"

  attr_accessible :quantity, :card_expires_on, :first_name, :last_name, :card_type, :card_number, :card_verification

  attr_accessor :card_number, :card_verification

  validate_on_create :validate_card

  def purchase
    response = GATEWAY.purchase(1000, credit_card, :ip => ip_address)
    transactions.create!(:action => "purchase", :amount => 1000, :response => response)
    update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

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

  private
  
    def validate_card
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
          errors.add_to_base message
        end
      end
    end
    
    def credit_card
      @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type               => card_type,
        :number             => card_number,
        :verification_value => card_verification,
        :month              => card_expires_on.month,
        :year               => card_expires_on.year,
        :first_name         => first_name,
        :last_name          => last_name
      )
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

