class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    items_names = []
    items.each do |item|
      items_names << item.name
    end
    return items_names
  end

  def unpopular_items
    unpop_items = []
    @items.each do |item|
      if item.bids.empty?
        unpop_items << item
      end
    end
    return unpop_items
  end

  def potential_revenue
    pop_items = []
    @items.each do |item|
      item.bids.each do |bid|
        if bid.empty? == false
          pop_items << bid
  #unpopular_items
  #current_high_bid

  #unpopular_items.each do |unpop|
  #if unpop.empty? == false
  #pop_items << unpop
      end
    end
    end
  end
end
