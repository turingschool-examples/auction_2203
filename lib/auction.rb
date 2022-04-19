
class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @item << item
  end
end
