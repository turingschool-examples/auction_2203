require './lib/attendee'
require './lib/auction'

class Item
  attr_reader :name, :bids


  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end

  def current_high_bid
    @bids.values.sort[-1]
  end






end
