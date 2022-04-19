class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @bidding = true
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount if @bidding == true
  end

  def current_high_bid
    @bids.max_by { |_attendee, bid| bid }[1]
  end

  def close_bidding
    @bidding = false
  end
end
