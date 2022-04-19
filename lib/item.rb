class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
    require "pry"; binding.pry
  end


end
