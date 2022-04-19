class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map(&:name)
  end

  def unpopular_items
    bad_items = []

    @items.each do |item|
      bad_items << item if item.bids == {}
    end
    bad_items
  end

  def potential_revenue
    all_revenue = 0
    @items.each do |item|
      all_revenue += item.current_high_bid unless item.current_high_bid.nil?
    end
    all_revenue
  end

  def bidders
    bidder_names = []
    @items.each do |item|
      item.bids.each do |attendee, _bid|
        bidder_names << attendee.name unless bidder_names.include?(attendee.name)
      end
    end
    bidder_names
  end

  def bidder_info
    bidder_hash = {}
    @items.each do |item|
      item.bids.each do |attendee, _bid|
        bidder_hash[attendee] = { budget: attendee.budget, items: attendee_items(attendee) }
      end
    end
    bidder_hash
  end

  def attendee_items(attendee)
    attendee_items = []
    @items.each do |item|
      item.bids.each do |bidder, _bid|
        attendee_items << item if attendee.name == bidder.name
      end
    end
    attendee_items
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end

  def close_auction
    close_hash = Hash.new('Not Sold')
    @items.each do |item|
      close_hash[item]
    end
    close_hash
  end

  def highest_bidder
    deep_pockets = []

    @items.each do |item|
      item.bids.map do |bidder, bid|
        deep_pockets << [bidder, bid]
        require 'pry'
        binding.pry
      end
    end
  end
end
