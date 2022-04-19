
class Auction
  attr_reader :items,
              :potential_revenue

  def initialize
    @items = []
    @potential_revenue = 0
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map {|item| item.name}
  end

  def unpopular_items
    @items.select {|item| item.bids.count == 0}
  end

  def potential_revenue
    bid_items = @items.select {|item| item.bids.count > 0}
    bid_items.each do |item|
      @potential_revenue += item.current_high_bid
    end
    @potential_revenue
  end

end
