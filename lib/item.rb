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
    @bids.values.max
  end

# another way to return current_high_bid by iteration
  # def current_high_bid
  #   highest = 0
  #   @bids.values.each do |amount|
  #     if amount > highest
  #       highest = amount
  #     end
  #   end
  #   highest
  # end
end
