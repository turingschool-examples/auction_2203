class Auction

  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_name = []
    @items.each do |item|
      item_name << item.name
    end
    item_name
  end

  def unpopular_items # not sure how to access bids hash
    require "pry"; binding.pry
    unpop = []
    @items.map do |unpop|
      if unpop[bids] == nil
        unpop
      end
    end
  end
end
