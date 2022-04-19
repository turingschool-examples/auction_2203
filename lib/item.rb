class Item

  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

  def add_bids(attendee, budget)
    # require 'pry' ; binding.pry
     bids[attendee] = budget
  end

  def current_high_bid
    # require 'pry' ; binding.pry
    bids.map {|k, v| v.max}#reach in to bids hash and give me the highest v in the hash
  end
end
