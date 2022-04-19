require './lib/item'
require './lib/attendee'

class Auction

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_names = []
    @items.map do |item|
      item_names << item.name
    end
    item_names
  end

  def unpopular_items
    unpopular_items = []
    @items.each do |item|
      unpopular_items << item if item.bids.values.count == 0
    end
    unpopular_items
  end

  def potential_revenue
    pot_rev = 0
    @items.each do |item|
      if item.bids.values.count >= 1
        pot_rev += item.bids.values.max
      end
    end
    pot_rev
  end

  def bidders
    bidders = []
    bidders_placeholder = []
    @items.each do |item|
      if item.bids.values.count >= 1
        bidders_placeholder << item
        a = bidders_placeholder.map { |item| item.bids.keys }.flatten.uniq
          bidders = a.map {|bidder| bidder.name}.uniq
      end
    end
    bidders
  end
end
