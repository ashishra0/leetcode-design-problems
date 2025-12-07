require_relative "payment_method"

class Card
  include PaymentMethod

  attr_accessor :card_no, :username

  def initialize(card_no, username)
    @card_no = card_no
    @username = username
  end
end
