
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

end
