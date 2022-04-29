class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items     # iterate through items and return items with no bids
    no_bids = []
    @items.each do |item|
      no_bids << item if item.bids == {}
    end
  end
end
