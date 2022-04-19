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
    items_bidded_on.map { |item| item.current_high_bid }.sum
  end

  def bidders
    items_bidded_on.map { |item| item.bids.keys }.flatten.map { |bidder| bidder.name }.uniq
  end

  def items_bidded_on
    @items - unpopular_items
  end
end
