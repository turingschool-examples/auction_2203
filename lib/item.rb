require './lib/attendee'
class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    if !@bids.frozen?
      @bids[attendee] = amount
    end
  end

  def current_high_bid
    @bids.values.sort.pop
  end

  def close_bidding
    @bids.freeze
  end
end
