require "./lib/attendee"

class Item
  attr_reader :name,
              :bids,
              :open_for_bidding

  def initialize(name)
    @bids = {}
    @name = name
    @open_for_bidding = true
  end

  def add_bid(attendee, bid)
    bids[attendee] = bid if open_for_bidding == true
  end

  def current_high_bid
    bids.max_by { |attendee, bid| bid }[1]
  end

  def close_bidding
    @open_for_bidding = false
  end
end
