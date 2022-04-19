class Item
  attr_reader :name, :bids, :open

  def initialize(name)
    @name = name
    @bids = {}
    @open = true
  end

  def add_bid(attendee, bid_amount)
    if @open
      @bids[attendee] = bid_amount
    end
  end

  def current_high_bid
    if @bids.count != 0
      @bids.max_by do |bid|
        bid[1]
      end[1]
    else
      0
    end
  end

  def close_bidding
    @open = false
  end

end
