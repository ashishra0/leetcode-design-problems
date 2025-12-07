require_relative 'card'

class CreditCard < Card

  def pay
    puts "paying via card #{card_no}"
  end
end
