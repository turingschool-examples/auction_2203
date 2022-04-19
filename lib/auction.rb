class Auction

  attr_reader :items, :today_date

  def initialize()
    @items = []
    @today_date = Date.today
  end

  def date
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
          info[attendee] = {budget: attendee.budget, items: item_array}
        end
      end
    end
    info
  end

  def close_auction
    closing = {}
    high_bids = Hash.new{|h,k| h[k] = {bid: 0, item: nil} }
    another_hash = {}

    @items.each do |item|
      item.bids.each do |k, v|
        if high_bids[k][:bid] < v
          high_bids[k][:bid] = v
          high_bids[k][:item] = item
        end
      end
    end

    @items.each do |item|
      high_bids.each do |k, v|
        if item.current_high_bid == v[:bid]
          closing[item] = k
        end
      end
    end

    hash

    # require 'pry'; binding.pry


  end


end
