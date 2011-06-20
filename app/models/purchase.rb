class Purchase < ActiveRecord::Base
  has_many :transactions, :class_name => "OrderTransaction"

  validate :validate_card, :on => :create
  validates :quantity, :numericality => true, :presence => true, :format => {:with => /^(?!-).*$/} 
  validates :card_type, :presence => true
  validates :card_number, :presence => true
  validates :card_verification, :presence => true
  validates :card_expires_on, :presence => true

  attr_accessor :card_number, :card_verification, :first_name, :last_name

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
          err = "card_type" if err=="type"
          errors.add(err.to_sym, mess.map{|e| I18n.t("credit_card."+e.gsub(/\s/,'_'))})
        end
      end
    end
    
    def credit_card
      @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type               => (::Rails.env=="test" ? "bogus" : card_type),
        :number             => (::Rails.env=="test" ? 1 : card_number),
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
#  ip_address      :string(255)
#

