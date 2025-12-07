require_relative 'card'

class DebitCard < Card

  def initialize(card_no, username)
    super(card_no, username)
  end

  def pay
    puts "paying via card #{card_no}"
  end
end
