class Item
attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end

  def current_high_bid
    arr = []
    @bids.map do |attendee, bid|
      arr << bid
      # require "pry"; binding.pry
    end
    arr.max
  end
end
