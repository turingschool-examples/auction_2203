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

  def potential_revenue
    revenue = 0
    array = @items.map { |item| item.current_high_bid }
      array.compact.sum
  end

  def bidders
    current_bidders = []
    array = @items.map { |item| item.bids }
      if array.include?(attendee.name)
    #unfinished! trying to isolate names of bidders to shovel into bidders array, but didn't quite get there. Needed to iterate one level deeper I believe to be able to call attendee.name 
    end
  end

end
