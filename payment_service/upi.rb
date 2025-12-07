require_relative "payment_method"

class Upi
  include PaymentMethod

  attr_accessor :up_id

  def initialize(upi_id)
    @upi_id = upi_id
  end

  def pay
    puts "paying via #{up_id}"
  end
end
