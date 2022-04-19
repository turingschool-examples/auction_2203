class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    no_bids_arr = []
    @items.each do |item|
      no_bids_arr << item if item.bids == {}
      end
      no_bids_arr
    end

  def potential_revenue
    bids = []
    @items.each do |item|
      bids << item.current_high_bid
    end
    bids.compact.sum
  end

  def bidders
    bidders = []
    @items.each do |item|
      # require 'pry';binding.pry
      item.bids.keys.each do |attendee|
        bidders << attendee.name
      end
      end
      bidders.uniq
  end


  def bidder_info
    bidder_hash = {}
    @items.each do |item|
      item.bids.each do |attendee|
        attendee.each do |info|
        bidder_hash[attendee] = {:budget => info.budget, :items => info.name}
        require 'pry';binding.pry
        end
      end
    end
  bidder_hash
  end
end
# require 'pry';binding.pry
