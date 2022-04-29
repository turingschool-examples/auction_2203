class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @bidding_open = true
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount if @bidding_open
  end

  def current_high_bid
    highest = 0
    @bids.each do |attendee, amount|
      highest = amount if amount > highest
    end
    highest
  end

  def close_bidding
    @bidding_open = false
  end
end
