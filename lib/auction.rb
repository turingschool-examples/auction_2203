require './lib/item'
require 'pry'

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.map {|item| names << item.name}
    names
  end

  def unpopular_items
    no_bids = []
    @items.each do |item|
      if item.bids == {}
        no_bids << item
      end
    end
    return no_bids
  end

  def potential_revenue
    total = 0
    @items.each do |item|
      # binding.pry
      #bid value cannot be nil when added. edit current_high bid
      total += item.current_high_bid
    end
    return total
  end
end
