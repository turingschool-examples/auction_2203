class Auction

  attr_reader :items

  def initialize()
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
    unpopular = []
    @items.each do |item|
      if item.bids.count == 0
        unpopular << item
      end
    end
    unpopular
  end

  def potential_revenue
    revenue = 0
    @items.each do |item|
      revenue += item.current_high_bid
    end
    revenue
  end

  def bidders
    names = []
    @items.each do |item|
      if item.bids.count > 0
        names << item.bids.keys[0].name
      end
    end
    names
  end


end
