class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(person, bid)
    @bids[person] = bid
  end

  def current_high_bid
    unless @bids.values == []
      @bids.values.max
    end
  end
end
