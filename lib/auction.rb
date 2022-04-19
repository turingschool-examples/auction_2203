class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.each do |item|
      names << item.name
    end
    names
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids.empty?
    # require "pry"; binding.pry
    end
  end

  def potential_revenue
    arr = []
    @items.each do |item|
      arr << item.current_high_bid.to_i
    end
    arr.sum
  end

  def bidders
    arr = []
    @items.map do |item|
      item.bids.map |attendee, bid|
        attendee.name
      end
      require "pry"; binding.pry
    end
  end
  end

end
