require_relative 'observable'

class PaymentService
  include Observable

  def make_payment(amount)
    puts "processing payment"
    sleep(2)
    event = { type: "payment_success", amount: amount, timestamp: Time.now }

    notify_observers(event)

    puts "done"
  end
end
