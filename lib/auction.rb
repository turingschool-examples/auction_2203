require "./lib/item"
require "./lib/attendee"

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def item_names
    items.map { |item| item.name }
  end

  def unpopular_items
    items.map { |item| item if item.bids == {} }.compact
  end

  def potential_revenue
    items.map do |item|
      item.current_high_bid if !unpopular_items.include?(item)
    end.compact.sum
  end

  def bidders
    bidders = []
    items.each do |item|
      item.bids.each { |attendee, bid| bidders << attendee.name}
    end
    bidders.uniq
  end

  def bidder_info
    bidder_info_hash = Hash.new
    items.each do |item|
      item.bids.each do |attendee, bid|
        bidder_info_hash[attendee] = attendee.info
      end
    end
    bidder_info_hash
  end
end
