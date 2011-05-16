class Cart < ActiveRecord::Base
  has_one :order
end
