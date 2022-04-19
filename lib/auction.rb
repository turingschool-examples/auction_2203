class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def item_names
    @items.each do |item|
      # require 'pry' ; binding.pry
      # when I run item.name in the pry it works??
      # ^ this is supposed to be a hash but hash methods don't work
      item.name
    end
  end



end
