
class Item
  attr_reader :name
  attr_accessor :bids
  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
      bids[attendee] = amount
    return bids
  end

  def current_high_bid
    bid_arr = []
    @bids.each do |bid|
      bid_arr << bid[1]
    end
     bid_arr.sort.last
  end

end
