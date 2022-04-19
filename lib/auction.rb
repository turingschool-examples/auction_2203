
class Auction
  attr_reader :items,
              :attendees,
              :bids
  def initialize
    @items = []
    @attendees = []
    @bids = Hash.new
  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_arr = []
    @items.each do |item|
      item_arr << item.name
    end
    item_arr
  end

  def add_attendee(attendee)
    @attendees << attendee
  end

  def unpopular_items
    #itterate through bids, make an array
    # of items that have been bidded on.
    #itterate through items, return any items
    # not in bidded array.
    bidded = []
    not_bidded = []
    @items[0].bids.each do |bid|
      bidded << bid
      if !items.include?(bid)
        # require "pry"; binding.pry
        not_bidded << bid
      end
    end
    not_bidded
  end

  def potential_revenue
    # itterate through bids hash,
    # find highest bid per item,
    # return sum of all of the highest bids
  end

  def bidders
    bidders = []
    @items[0].bids.each do |bid|
      bidders << bid[0].name
    end
    bidders
  end
end
