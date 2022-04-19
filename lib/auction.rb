class Auction
  attr_reader :items, :bids

  def initialize
    @items = []
    @bids = {}
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def add_bid(attendee, bid)
    require "pry"; binding.pry
  end
end


#  1. Return the current high bid of an Item: `Item #current_high_bid`
#  1. Return the list of unpopular items from an Auction: `Auction #unpopular_items`
#  1. Return the potential revenue from an Auction: `Auction #potential_revenue`
#
# Use TDD to update your classes to respond to the following interaction pattern.  Some notes:
# - `unpopular_items` are those items which have no bids.
# - `potential_revenue` is the total possible sale price of the items (the items highest bid)
