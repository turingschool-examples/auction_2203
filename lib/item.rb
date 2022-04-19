class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @bidable = true
  end

  def add_bid(attendee, bid)
    if @bidable == true
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    @bids.each do | k, v|
      if v == @bids.values.max
        return v
      end
    end
  end

  def close_bidding
    @bidable = false
  end


end
