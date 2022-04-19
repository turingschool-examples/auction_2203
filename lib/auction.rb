class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.each do |item|
      names << item.name
    end
    names
  end

  def unpopular_items
    no_bid = []
    @items.each do |item|
      if item.bids == {}
        no_bid << item
      end
    end
    no_bid
  end

  def potential_revenue
    pot_rev = []
    @items.each do |item|
      if item.current_high_bid != {}
        pot_rev << item.current_high_bid
      end
    end
    pot_rev.sum
  end

  def bidders
    bidders_names = []
    @items.each do |item|
      if item.bids != {}
        item.bids.each do |k,v|
          bidders_names << k.name
        end
      end
    end
    bidders_names.uniq
  end

  def bidder_info
    bidders_h = {}
    items.each do |item|
      item.bids.each do |k,v|
        bidders_h[k] = {:budget => k.budget, :items => item}
        # started trying to use something like
        #item.bids.select{|kk,vv| k == kk} item
        #to get all the items the bidder has bid on in the array
        #but was unable to get it working properly.

      end
    end
    bidders_h
  end



end
