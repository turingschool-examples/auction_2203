require './lib/item'
require './lib/auction'
require './lib/attendee'

describe Item do
  let(:auction) { Auction.new }
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:attendee) { Attendee.new({name: 'Megan', budget: '$50'}) }

  it "exists" do
    expect(item1).to be_a Item
  end

  it "has attributes" do
    expect(item1.name).to eq('Chalkware Piggy Bank')
    expect(item1.bids).to eq({})
  end

  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:item3) { Item.new('Homemade Chocolate Chip Cookies') }
  let(:item4) { Item.new('2 Days Dogsitting') }
  let(:item5) { Item.new('Forever Stamps') }
  let(:attendee1) { Attendee.new({name: 'Megan', budget: '$50'}) }
  let(:attendee2) { Attendee.new({name: 'Bob', budget: '$75'}) }
  let(:attendee3) { Attendee.new({name: 'Mike', budget: '$100'}) }
  let(:auction) { Auction.new }

  it "Attendees can bid on items" do
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expected = {
      attendee2 => 20,
      attendee1 => 22
    }

    expect(item1.bids).to eq(expected)
  end

  it "return current high bid of an item" do
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.current_high_bid).to eq(22)
  end
end
