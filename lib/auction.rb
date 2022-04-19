class Auction
  attr_reader :items

  def initialize
    @items = Array.new(0)
  end

  def add_item(item)
    @items << item
  end

  def items_names
    item_array = Array.new(0)
    @items.each do |item|
      item_array << item.name
    end
    item_array
  end

  def unpopular_items
    unpop_array = Array.new(0)
    @items.each do |item|
    unpop_array << item if item.bids.empty?()
    end
    unpop_array
  end

  def potential_revenue
    pot_rev = 0
    @items.each do |item|
      pot_rev += item.current_high_bid if !item.bids.empty?()
    end
    pot_rev
  end

  def bidders
    bidders_array = Array.new(0)
    @items.each do |item|
      item.bids.each do |attendee, bid|
        bidders_array << attendee.name if !bidders_array.include?(attendee.name)
      end
    end
    bidders_array
  end

  def bidder_info
    bidders_info = Hash.new(0)
    @items.each do |item|
      item.bids.each do |attendee, bid|
        bidders_info[attendee] = {budget: attendee.budget}
      end
    end
    bidders_info
  end

end
