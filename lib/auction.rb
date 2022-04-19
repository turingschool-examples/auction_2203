class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
  item_name = []
    @items.each do |item|
      item_name << item.name
    end
    return item_name
  end

  def unpopular_items
    no_bid_items = []
    @items.each do |item|
  # require 'pry'; binding.pry
      if item.bids == 0
        no_bid_items << item
      end
    end
  end

end
