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
    # @items.map do |item|
      # require 'pry';binding.pry
      # if item.bids == {}
      #   item
      # end
    @items.find_all do |item|
      item.bids == {}
    end

  end

  def potential_revenue
    @items.map do |item|
      require 'pry';binding.pry
      # item.current_high_bid.sum # trying to add all current highest bids across bidded items
    end
  end

end
