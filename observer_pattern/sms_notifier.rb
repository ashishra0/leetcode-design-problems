class SmsNotifier
  def update(event)
    puts "[SMS] Payment of #{event[:amount]} successful at #{event[:timestamp]}"
  end
end
