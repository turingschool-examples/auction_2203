require "./lib/item"
require "./lib/attendee"

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def item_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    @items.map { |item| item if item.bids == {} }.compact
  end
end
