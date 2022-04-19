class Auction
  attr_reader :items


  def initialize
    @items = []

  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_array = []
    @items.map do |item|
      item_array << item.name
    end
    item_array
  end

  def unpopular_items
    unpop_array = []
    @items.each do |item|
      if item.bids == {}
        unpop_array << item
      end
    end
    unpop_array
  end

  def potential_revenue
    highest_bids = []
    things = []
    @items.each do |thing|
      things << item
    end
    @things.each do
  end
end
# bid.each do |attendee, bid|
# highest_bids << bid.sort.pop
# end
# end
