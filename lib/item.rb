class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid.to_i
  end

  def current_high_bid
    highest = 0
    @bids.values.each do |amount|
      if amount > highest
        highest = amount
      end
    end
    highest
  end

# the method below returns the current_high_bid, BUT it returns a nil value for potential_revenue method
  # def current_high_bid
  #   @bids.values.max
  # end
end
