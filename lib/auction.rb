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
end