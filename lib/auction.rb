require 'date'
class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    @items.select { |item| item.bids.length == 0 }
  end

  def potential_revenue
    items_bidded_on.map { |item| item.current_high_bid }.sum
  end

  def bidders
    current_bidders.map { |bidder| bidder.name }.uniq
  end

  def items_bidded_on
    @items - unpopular_items
  end

  def bidder_info
    bidder_hash = {}
    current_bidders.each do |bidder|
      bidder_hash[bidder] = { budget: bidder.budget, items: [] } if bidder_hash[bidder].nil?
      @items.each do |item|
        bidder_hash[bidder][:items] << item if item.bids.keys.include?(bidder)
      end
    end
    bidder_hash
  end

  def current_bidders
    items_bidded_on.map { |item| item.bids.keys }.flatten.uniq
  end

  def date
    date = Date.today
    "#{date.day}/0#{date.month}/#{date.year}"
  end
end
