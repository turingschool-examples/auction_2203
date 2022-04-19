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

  def bidders
    bidder_names = []
    @items.each do |item|
      item.bids.each do |bidder, bid|
        bidder_names << bidder.name
      end
    end
    bidder_names.uniq
  end

  def bidder_info
    bidder_objects = []
    @items.each do |item|
      item.bids.each do |bidder, bid|
        bidder_objects << bidder
      end
    end

    bidder_info_hash = Hash.new(0)
    bidder_objects.each do |bidder|
      bidder_info_hash[bidder] = {budget: bidder.budget, items: []}
      @items.each do |item|
        bidder_info_hash[bidder][:items] << item if item.bids.keys.include?(bidder)
      end
    end
    bidder_info_hash
  end
end
