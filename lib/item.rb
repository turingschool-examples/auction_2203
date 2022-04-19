require './lib/attendee'

class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @is_closed = false
  end

  def add_bid(attendee, bid)
    if @is_closed == false
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    @bids.max_by{|attendee, bid| bid}[1]
  end

  def close_bidding
    @is_closed = true
  end
end
