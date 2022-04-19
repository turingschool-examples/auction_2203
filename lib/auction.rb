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

  def unpopular_items
    @items.select do |item|
      item.bids.count == 0
    end
  end

  def potential_revenue
    @items.reduce(0) do |memo, item|
      memo + item.current_high_bid
    end
  end
end
