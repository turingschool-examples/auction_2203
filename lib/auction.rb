class Auction

  attr_reader :items


  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def item_names
    # require 'pry' ; binding.pry
    # items.map(&:name)
    items.map do |item|
      item.name
    end
  end


end
