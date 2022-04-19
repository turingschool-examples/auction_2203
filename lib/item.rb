

class Item

  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @accept_bids = true
  end

  def add_bid(attendee, bid)
    if @accept_bids
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    high_bid = 0
    @bids.each do |attendee, bid|
      if bid > high_bid
        high_bid = bid
      end
    end
    return high_bid
  end

  def close_bidding
    @accept_bids = false
  end

end
