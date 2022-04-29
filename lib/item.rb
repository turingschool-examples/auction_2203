class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end

  def current_high_bid # !!!!!!! DO AGAIN !!!!!!!!
    highest = 0
    @bids.values.each do |bid|
      highest = bid if bid > highest
    end
    highest
  end
end
