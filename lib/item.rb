class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    if bids[attendee].nil?
      bids[attendee] = bid
      else
      bids[attendee] += bid
    end
  end

  def current_high_bid
    bids.values.max
  end
end
