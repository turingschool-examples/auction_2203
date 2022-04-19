class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map! {|item| item.name}
  end

  def unpopular_items
    unpopular_items = []
    @items.each do |item|
      unpopular_items << item if item.bids == {}
    end
    unpopular_items
  end


end
