require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
  before :each do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
  end

  it "exists" do
    expect(@auction).to be_a(Auction)

  end

  xit "has attributes" do
    expect(@auction.items).to eq([])#wprked before adding items to before each
  end

  it "can add items" do
    expect(@auction.items).to eq([@item1, @item2, @item3, @item4, @item5])
  end

  it "can read item names" do
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame", 'Homemade Chocolate Chip Cookies', "2 Days Dogsitting", "Forever Stamps"])
  end

  it "starts with no bids" do
    expect(@item1.bids).to eq({})
  end

  it "can add bids" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expect(@item1.bids).to eq({
      @attendee2 => 20,
       @attendee1 => 22
       })
  end

  it "can find highest bid" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expect(@item1.current_high_bid).to eq(22)
  end

  it "can list unpopular items" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expect(@auction.unpopular_items).to eq([@item2, @item3, @item4, @item5])

    @item4.add_bid(@attendee3, 50)

    expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])

    @item3.add_bid(@attendee2, 15)

    expect(@auction.unpopular_items).to eq([@item2, @item5])
  end

  it "can determine potential revenue" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    expect(@auction.potential_revenue).to eq(87)
  end
end
