class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, money)
    # require 'pry';binding.pry
    @bids[attendee] = money
  end

  def current_high_bid
    # require 'pry';binding.pry
    @bids.values.max
  end
end
