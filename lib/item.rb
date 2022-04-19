class Item
  attr_reader :name, :bids

def initialize(name, bids = {})
  @name = name
  @bids = bids
  @bidding_open = true
end

  def add_bid(attendee, budget)
    @bids[attendee] = budget if @bidding_open
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @bidding_open = false
  end
end
