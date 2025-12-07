class PaymentService

  attr_accessor :payment_methods

  def initialize
    @payment_methods = {}
  end

  def add_payment_method(name, payment_method)
    payment_methods[name] = payment_method
  end

  def get_payment_method(name)
    payment_methods[name]
  end

  def make_payment(name)
    method = get_payment_method(name)
    method&.pay
  end
end
