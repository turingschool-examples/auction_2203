# item.rb
require 'pry'

class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = {}
    @accepting_bids = true
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid if @accepting_bids
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @accepting_bids = !@accepting_bids
  end
end
