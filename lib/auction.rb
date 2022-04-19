# auction.rb
require 'pry'
require './lib/item'
require './lib/attendee'

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def unpopular_items
    unpop = []
    @items.each do |item|
      unpop << item if item.bids.empty?
    end
    unpop
  end

  def potential_revenue
    sum = 0
    @items.each do |item|
      sum += item.bids.values.max if !unpopular_items.include?(item)
    end
    sum
  end
end
