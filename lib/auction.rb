class Auction
  attr_reader :items, :bids

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end
  # def item_names
  #   @items.map do |item|
  #     item.name
  #   end
  # end

  def unpopular_items
    @items.select { |item| item.bids.empty? }
  end

  # def unpopular_items
  #   no_bid_items = []
  #   @items.each do |item|
  #     if item.bids.empty?
  #     end
  #     no_bid_items
  #   end
  # end
  #
  # def unpopular_items
  #   no_bid_items = []
  #   @items.each do |item|
  #     if item.bids.keys.length == 0
  #       no_bid_items << item
  #     end
  #   end
  #   no_bid_items
  # end
end
