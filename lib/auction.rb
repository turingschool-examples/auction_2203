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
end
