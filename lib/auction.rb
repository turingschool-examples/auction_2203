require './lib/item'
require './lib/attendee'
class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    @items.select { |item| item.bids == {}}
  end

  def potential_revenue
    forseen_revenue = @items.map { |item| item.current_high_bid  }
    (forseen_revenue.compact).sum
  end

  def bidders
    all_attendee_bids = @items.map { |item| item.bids.keys }
    indiv_attendee = all_attendee_bids.flatten.uniq
    indiv_attendee.map { |attendee| attendee.name  }
  end

  def bidder_info
    bidder_hash = {}
    @items.each do |item|
      item.bids.each do |k, v|
        if bidder_hash.include?(k)
          bidder_hash[k][:items] << item
        else
          bidder_hash[k] = {budget: (k.budget), items: [item]}
        end
      end
    end
    bidder_hash
  end
end
