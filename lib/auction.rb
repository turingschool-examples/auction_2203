

class Auction

  attr_reader :items

  def initialize()
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names_arr = []
    @items.each do |item|
      names_arr << item.name
    end
    return names_arr
  end

  def unpopular_items
    unpop_items = []
    @items.each do |item|
      if item.bids == {}
        unpop_items << item
      end
    end
    unpop_items
  end

  def potential_revenue
    rev = 0
    @items.each do |item|
      rev += item.current_high_bid
    end
    return rev
  end
end
