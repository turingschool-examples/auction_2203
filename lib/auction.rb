class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    unpopular = []
    @items.each do |item|
      if item.bids == {}
        unpopular << item
      end
    end
    unpopular 
  end

end
