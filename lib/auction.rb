

class Auction

  attr_reader :items

  def initialize()
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names_arr = []
    @items.each do |item|
      names_arr << item.name
    end
    return names_arr
  end

end
