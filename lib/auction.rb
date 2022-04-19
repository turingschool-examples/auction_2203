class Auction
  attr_reader :items

  def initialize
    @items = []
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
    no_bids_arr = []
    @items.each do |item|
      no_bids_arr << item if item.bids == {}
      end
      no_bids_arr
    end

  def potential_revenue
    bids = []
    @items.each do |item|
      bids << item.current_high_bid
    end
    bids.compact.sum
  end
  # alternate version vvv
  # def potential_revenue
  #   @items.sum do |item|
  #     item.current_high_bid.to_i
  #   end
  # end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.keys.each do |attendee|
        bidders << attendee.name
      end
      end
      bidders.uniq
  end


  def bidder_info
    bidder_hash = {}

    @items.each do |item|
      item.bids.each do |attendee, amount|
        if bidder_hash[attendee].nil?
          bidder_hash[attendee] = {
            budget: attendee.budget,
            items: [item]
          }
        else
          bidder_hash[attendee][:items] << item
        end
      end
    end
    bidder_hash
  end
end
# require 'pry';binding.pry
