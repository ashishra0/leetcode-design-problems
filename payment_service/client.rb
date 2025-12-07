require_relative "payment_service"
require_relative "credit_card"
require_relative "debit_card"
require_relative "upi"
require_relative "wallet"

class Client

  attr_accessor :payment_service

  def initialize
    @payment_service = PaymentService.new
    payment_service.add_payment_method("HDFC infinia", CreditCard.new("1234", "Ashish"))
    payment_service.add_payment_method("IndusInd debit", DebitCard.new("5678", "Ashish"))
    payment_service.add_payment_method("ashish@ybl", Upi.new("ashish@ybl"))
    payment_service.add_payment_method("cred", Wallet.new("cred"))
  end
end
