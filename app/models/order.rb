require 'cgi/session'

class Order < ActiveRecord::Base
  include AASM

  has_many :transactions, :class_name => "OrderTransaction"

  validate :validate_card, :on => :create
  #validates :quantity, :numericality => true, :presence => true, :format => {:with => /^(?!-).*$/} 
  validates :card_type, :presence => true
  validates :card_number, :presence => true
  validates :card_verification, :presence => true
  validates :card_expires_on, :presence => true

  attr_accessor :card_number, :card_verification, :first_name, :last_name

  aasm_initial_state :pending
  aasm_state :pending
  aasm_state :authorized
  aasm_state :paid
  aasm_state :payment_declined

  aasm_event :payment_authorized do
    transitions :to => :authorized, :from => [:pending]
    transitions :to => :authorized, :from => [:payment_declined]
  end
  aasm_event :payment_captured do
    transitions :from => :authorized, :to => :paid
  end
  aasm_event :transaction_declined do
    transitions :from => :pending, :to => :payment_declined
    transitions :from => :payment_declined, :to => :payment_declined
    transitions :from => :authorized, :to => :authorized
  end

  def authorize_payment(credit_card, options = {})
    options[:order_id] = number
    transaction do # to ensure atomicity of the transaction
      authorization = OrderTransaction.authorize(amount,credit_card,options)
      transactions.push(authorization)
      authorization.success? ? payment_authorized : transaction_declined
      authorization
    end
  end
  def capture_payment(options = {})
    transaction do
      capture = OrderTransaction.capture(amount, authorization_reference, options)
      transactions.push(capture)
      capture.success? ? payment_captured : transaction_declined
      capture
    end
  end  
  
  def authorization_reference
    if authorization = transactions.find_by_action_and_success('authorization', true, :order => 'id ASC')
      authorization.reference
    end
  end

  def purchase
    response = GATEWAY.purchase(1000, credit_card, :ip => ip_address)
    transactions.create!(:action => "purchase", :amount => 1000, :response => response)
    update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  private

    def number
      ActiveSupport::SecureRandom.hex(16)
    end

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
# Table name: orders
#
#  id              :integer(4)      not null, primary key
#  amount          :integer(4)
#  card_type       :string(255)
#  card_expires_on :date
#  purchased_at    :datetime
#  created_at      :datetime
#  updated_at      :datetime
#  ip_address      :string(255)
#  description     :string(255)
#  aasm_state      :string(255)
#

