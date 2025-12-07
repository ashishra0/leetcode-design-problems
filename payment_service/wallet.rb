require_relative "payment_method"

class Wallet
  include PaymentMethod

  attr_accessor :address

  def initialize(address)
    @address = address
  end

  def pay
    puts "paying via #{address}"
  end

end
