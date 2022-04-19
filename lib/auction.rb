require './lib/item'
require './lib/attendee'
require 'pry'

class Auction
  attr_reader :items

  def initialize
    @items = Array.new
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.each do |item|
      names << item.name
    end
    names
  end

  def unpopular_items
    not_popular = []
    @items.each do |item|
      not_popular << item.name if item.bids < item.current_high_bid
      binding.pry
    end
    not_popular.sort[-2]
  end
end
