class Auction

  attr_reader :items, :today_date

  def initialize()
    @items = []
    @today_date = Date.today
  end

  def date
    # require 'pry'; binding.pry
    date = "#{today_date.day}/#{today_date.month}/#{today_date.year}"
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
    unpopular = []
    @items.each do |item|
      if item.bids.count == 0
        unpopular << item
      end
    end
    unpopular
  end

  def potential_revenue
    revenue = 0
    @items.each do |item|
      revenue += item.current_high_bid
    end
    revenue
  end

  def bidders
    names = []
    @items.each do |item|
      if item.bids.count > 0
        names << item.bids.keys[0].name
      end
    end
    names
  end

  def bidder_attendees
    attendees = []
    @items.each do |item|
      if item.bids.count > 0
        attendees << item.bids.keys[0]
      end
    end
    attendees
  end

  def bidder_info
    info = Hash.new{|h,k| h[k] = {budget: 0, items: []} }
    bidder_attendees.each do |attendee|
      item_array = []
      @items.each do |item|
        if item.bids.include?(attendee)
          item_array << item
          info[attendee] = {budget: attendee.budget,
                            items: item_array}
        end
      end
    end
    # require 'pry'; binding.pry
    info
  end


end
