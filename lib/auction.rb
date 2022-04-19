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
    no_bids_arr = []
    @items.each do |item|
      no_bids_arr << item if item.bids == {}
      end
      no_bids_arr
    end

  def potential_revenue
    bids = []
    @items.each do |item|
      bids << item.current_high_bid
    end
    bids.compact.sum 
  end
end
