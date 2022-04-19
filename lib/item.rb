class Item
  attr_reader :name,
    :bids

  def initialize(name)
    @name = name
    @bids = {}
    @open = true
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid if @open == true
  end

  def current_high_bid
    if @bids.count > 0
      @bids.max_by { |k, v| v }[1]
    else
      0
    end
  end

  def close_bidding
    @open = false
  end
end
