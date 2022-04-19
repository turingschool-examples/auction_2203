class Auction

attr_reader :items
    def initialize
        @items = []
    end

    def add_item(item)
        @items << item
    end

    def item_names
        items.map! { |item| item.name }
    end

    def unpopular_items
        items.find_all { |item| item.bids == {} }
    end

    def potential_revenue
        #the total of all the items highests bids - take into account current_high_bid
        items.map { |item| item.current_high_bid }.compact!.sum
    end
    
    def bidders
        items.flat_map { |item| item.bids.keys.map { |attributes| attributes.name }}.uniq
    end

    def bidder_info
        bidders_info = {}
        attendees = items.find_all { |item| item.bids != {} } 
        attendees.each do |attendee|
            bidders_info[attendee.bids] = {budget:0, items: []}
        end
        
        # budget = 0
        # items.each { |item| item.bids.map { |key, value| budget = key.budget }}
        # # bidders_info[attendees] = {budget: budget, items: []} #has a stagnating budget - only returning last budget
        # require 'pry'; binding.pry
    end
end