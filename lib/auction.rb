

class Auction

  attr_reader :items

  def initialize()
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names_arr = []
    @items.each do |item|
      names_arr << item.name
    end
    return names_arr
  end

  def unpopular_items
    unpop_items = []
    @items.each do |item|
      if item.bids == {}
        unpop_items << item
      end
    end
    unpop_items
  end

  def potential_revenue
    rev = 0
    @items.each do |item|
      rev += item.current_high_bid
    end
    return rev
  end

  def bidders
    bidder_names = []
    @items.each do |item|
      item.bids.keys.each do |attendee|
        bidder_names << attendee.name
      end
    end
    return bidder_names.uniq
  end

  def bidder_info
    bid_info = {}
    @items.each do |item|
      item.bids.each do |attendee, bid|
        if bid_info[attendee]
          bid_info[attendee][:items] << item
        else
          bid_info[attendee] = {budget: attendee.budget, items: [item]}
        end
      end
    end
    return bid_info
  end
end
