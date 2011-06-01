class Order < ActiveRecord::Base
  has_many :transactions, :class_name => "OrderTransaction"

  attr_accessible :first_name, :last_name, :email, :address, :city, :zipcode, :country

  geocoded_by :full_address
  after_validation :geocode

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates :address, :presence => true
  validates :city, :presence => true
  validates :zipcode, :presence => true
  validates :country, :presence => true
  validates :email, :presence => true

  def purchase
    response = GATEWAY.purchase(1000, credit_card, :ip => ip_address)
    transactions.create!(:action => "purchase", :amount => 1000, :response => response)
    update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def full_address; "#{address}, #{city}, #{zipcode} #{country}" end

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
#  id         :integer(4)      not null, primary key
#  ip_address :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#  country    :string(255)
#  city       :string(255)
#  address    :string(255)
#  zipcode    :string(255)
#  email      :string(255)
#  phone      :string(255)
#  latitude   :float
#  longitude  :float
#

