class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = {}
    @allow_bidding = true
  end

  def add_bid(attendee, amount)
    if @allow_bidding
      @bids[attendee] = amount
    end
  end

  def current_high_bid
    @bids.sort_by{|k, v| v}.last[1]
  end

  def close_bidding
    @allow_bidding = false
  end
end
