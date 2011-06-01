class Purchase < ActiveRecord::Base
  validate :validate_card, :on => :create
  validates :quantity, :numericality => true, :presence => true, :format => {:with => /^(?!-).*$/} 
  validates :card_type, :presence => true
  validates :card_number, :presence => true
  validates :card_verification, :presence => true
  validates :card_expires_on, :presence => true

  attr_accessor :card_number, :card_verification, :first_name, :last_name

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
        :month              => card_expires_on ? card_expires_on.month : "",
        :year               => card_expires_on ? card_expires_on.year : "",
        :first_name         => first_name,
        :last_name          => last_name
      )
    end
end

# == Schema Information
#
# Table name: purchases
#
#  id              :integer(4)      not null, primary key
#  quantity        :integer(4)
#  card_type       :string(255)
#  card_expires_on :date
#  purchased_at    :datetime
#  created_at      :datetime
#  updated_at      :datetime
#

