class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid_amount)
    @bids[attendee] = bid_amount
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

end
