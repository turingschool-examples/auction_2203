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
    names_of_items = []
  #  binding.pry
  # return and array of just the item names
  # I have access to @items
  # how do I call the name attribute of those items?
  # tried items.name, @items.names, name, item.name
  end

  def bids
    item_bids = {}
    @items.map do |item|
      item_bids[item] = @item.bids

    end
    #Attendee being the key and the bids being the value

  end

  def add_bid(attendee, bid)


  end

end
