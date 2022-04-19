
class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_arr = []
    @items.each do |item|
      item_arr << item.name
      # require "pry"; binding.pry
    end
    item_arr
  end

end
