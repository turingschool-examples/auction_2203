class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @bids = {}
    @name = name
  end
end
