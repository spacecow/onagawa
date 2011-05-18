class Order < ActiveRecord::Base
  has_many :transactions, :class_name => "OrderTransaction"

  attr_accessible :quantity, :card_expires_on, :first_name, :last_name, :card_type, :card_number, :card_verification

  attr_accessor :card_number, :card_verification

  validate :validate_card, :on => :create
  validates :quantity, :numericality => true, :format => {:with => /^(?!-).*$/} 

  def purchase
    response = GATEWAY.purchase(1000, credit_card, :ip => ip_address)
    transactions.create!(:action => "purchase", :amount => 1000, :response => response)
    update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end


  private
  
    def validate_card
      unless credit_card.valid?
        credit_card.errors.each do |err,mess|
          err = "card_expires_on" if err=="year"
          err = "card_number" if err=="number"
          err = "card_verification" if err=="verification_value"
          errors.add(err.to_sym, mess)
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
