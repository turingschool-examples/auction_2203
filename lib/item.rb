
class Item
  attr_reader :name,
              :bids
              # :attendees
  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
      bids[attendee] = amount
    return bids
  end
end
