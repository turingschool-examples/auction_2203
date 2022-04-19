class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    @items.select { |item| item.bids.length == 0 }
  end

  def potential_revenue
    (@items - unpopular_items).map { |item| item.current_high_bid }.sum
  end
end
