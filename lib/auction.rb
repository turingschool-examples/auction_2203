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
    item_name = []
    @items.each do |item|
      item_name << item.name
    end
    return item_name
  end

  def bids
    binding.pry 
    bids_hash = Hash.new(0)

  end
end
