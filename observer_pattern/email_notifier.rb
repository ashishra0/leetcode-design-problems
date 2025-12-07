class EmailNotifier
  def update(event)
    puts "[EMAIL] Payment of #{event[:amount]} successful at #{event[:timestamp]}"
  end
end
