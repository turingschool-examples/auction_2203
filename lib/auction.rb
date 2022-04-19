require "./lib/attendee"
require "./lib/item"
require "pry"

class Auction
  attr_reader :items
  def initialize
    @items = []
    @unpopular_items_array = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    binding.pry
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.each do |item|
      if item.bids.empty?
        if true
          @unpopular_items_array << item
        end
      end
    end
    @unpopular_items_array
  end

  def potential_revenue
    total = 0
    @items.each do |item|
      total += item.current_high_bid.to_f
    end
    return total
  end

  def bidders
    bidders_array = []
    @items.each do |item|
      item.bids.each do |k, v|
        if !bidders_array.include?(k.name)
          bidders_array << k.name
        end
      end
    end
    return bidders_array
  end
end
