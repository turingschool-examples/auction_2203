class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, value)
    @bids[attendee] = value
  end

  def current_high_bid
    high_bid = []
    @bids.map do |_k, v|
      high_bid << v
    end
    high_bid.max
  end

  def close_bidding
    @bids.freeze
  end
end
