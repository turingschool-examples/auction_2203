
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

  def bid_items
    bid_items_array = @items.select {|item| item.bids.count > 0}
  end

  def potential_revenue
    bid_items.each do |item|
      @potential_revenue += item.current_high_bid
    end
    @potential_revenue
  end

  def bidders
    bidders_array = []
    bid_items.each do |item|
      item.bids.each do |bid|
        bidders_array << bid[0].name
      end
    end
    bidders_array.uniq
  end

end
