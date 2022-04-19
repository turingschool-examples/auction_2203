class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid.to_i
  end

  # def current_high_bid
  #
  # end



end

# got stuck on current_high_bid. Return the highest value of @bids. Below is what I've tried.

# def current_high_bid
#   bid_amount = 0
#   @bids.each do |bid|
#     require "pry"; binding.pry bid
# => [#<Attendee:0x00007f95d69fdf08 @budget=75, @name="Bob">, 20]
#     bid_amount += bid
#   end
#   bid_amount
# end

# def current_high_bid
#   @bids.select do |bid|
#     bid.max
#   end
# end
