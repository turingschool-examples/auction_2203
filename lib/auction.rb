class Auction
  attr_reader :items

  def initialize
    @items = Array.new
  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_names_arr = Array.new
    @items.each do |item|
      item_names_arr << item.name
    end
    item_names_arr
  end

  def unpopular_items
    unpopular_array = Array.new
    @items.each do |item|
      if item.bids.count == 0
        unpopular_array << item
      end
    end
    unpopular_array
  end

  def potential_revenue
    high_bids_array = Array.new
    @items.each do |item|
      if item.bids.count >= 1
        high_bids_array << item.current_high_bid
      end
    # binding.pry
    end
    high_bids_array.sum
  end

  def bidders
    bidders_array = Array.new

    @items.each do |item|
      if item.bids.count >= 1
        item.bids.each do |bid|
          if item.current_high_bid == bid.last
            bid.each do |attendee|
              bidders_array << attendee.name

          binding.pry
            end
          end
        end
      end
    end
  end
end
