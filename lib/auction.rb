require './lib/item'
require './lib/attendee'

class Auction
  attr_reader :items

  def initialize
    @items = Array.new
  end

  def add_item(item)
    @items << item
  end


end
