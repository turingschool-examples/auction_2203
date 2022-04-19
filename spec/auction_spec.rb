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

    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  it 'exists and has attributes' do
    expect(@auction).to be_a(Auction)
    expect(@auction.items).to eq([])
  end

  it 'can store and return items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.items).to eq([@item1, @item2])
  end

  it 'can store and return item names' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

  it 'places bids on item and can return bids on item' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@item1.bids).to eq({})
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @expected = {
                  @attendee2 => 20,
                  @attendee1 => 22
                }
    expect(@item1.bids).to eq(@expected)
  end

  it 'can return an items highest placed bid' do
    @auction.add_item(@item1)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.current_high_bid).to eq(22)
  end

  it 'can return items that have no bids placed yet' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
    @item3.add_bid(@attendee2, 15)
    expect(@auction.unpopular_items).to eq([@item2, @item5])
  end

  it 'can sum highest bids and return' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    expect(@auction.potential_revenue).to eq(87)

  end

end
