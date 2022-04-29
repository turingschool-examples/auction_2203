class Auction
  attr_reader :items,
              :bids

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end
  # OR
  # def item_names
  #   @items.map do |item|
  #     item.name
  #   end
  # end

  def unpopular_items
    @items.select { |item| item.bids.empty? }
  end
  # OR
  # def unpopular_items
  #   no_bid_items = []
  #   @items.each do |item|
  #     if item.bids.empty?
  #     end
  #     no_bid_items
  #   end
  # end
  # OR
  # def unpopular_items
  #   no_bid_items = []
  #   @items.each do |item|
  #     if item.bids.keys.length == 0
  #       no_bid_items << item
  #     end
  #   end
  #   no_bid_items
  # end
  def unpopular_items
    @items.select { |item| item if item.bids.count == 0 }
  end
  # OR
  # def unpopular_items
  #   @items.select do |item|
  #     item if item.bids.count == 0
  #   end
  #   no_bids
  # end
  # OR
  # def potential_revenue
  #   revenue = 0
  #   @items.each do |item|
  #     revenue += item.current_high_bid
  #   end
  #   revenue
  # end

  def potential_revenue
    revenue = 0
    @items.each do |item|
      revenue += item.current_high_bid
    end
    revenue
  end

# # ITERATION 3: Graded Items:
#  1. Return the list of bidder names from an Auction: `Auction #bidders`

  def bidders
    names = []
    @items.map do |item|
      item.bids.keys.each do |attendee|
        names << attendee.name
      end
    end
    names.uniq
  end
  # OR
  # def bidders
  #   names = []
  #   @items.map do |item|
  #     item.bids.keys.each do |attendee|
  #       if !names.include? attendee.name
  #         names << attendee.name
  #       end
  #     end
  #   end
  #   names
  # end

  def bidder_info
    info = {}
    @items.each do |item|
      item.bids.keys.each do |attendee|
        if info[attendee].nil?
          info[attendee] = {
            budget: attendee.budget,
            items: [item]
          }
        else
          info[attendee][:items] << item
        end
      end
    end
    info
  end
end
