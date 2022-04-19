require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
  let(:auction) {Auction.new}
  let(:item1) {Item.new('Chalkware Piggy Bank')}
  let(:item2) {Item.new('Bamboo Picture Frame')}
  let(:item3) {Item.new('Homemade Chocolate Chip Cookies')}
  let(:item4) {Item.new('2 Days Dogsitting')}
  let(:item5) {Item.new('Forever Stamps')}
  let(:attendee1) {Attendee.new({name: 'Megan', budget: '$50'})}
  let(:attendee2) {Attendee.new({name: 'Bob', budget: '$75'})}
  let(:attendee3) {Attendee.new({name: 'Mike', budget: '$100'})}


  it "exists" do
    expect(auction).to be_a(Auction)
  end

  it "has readable attributes" do
    expect(auction.items).to eq([])
    expect(auction.potential_revenue).to eq(0)
  end

  it "can add items" do
    auction.add_item(item1)
    auction.add_item(item2)

    expect(auction.items).to eq([item1, item2])
  end

  it "can return the name of the items" do
    auction.add_item(item1)
    auction.add_item(item2)

    expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

  it "can return unpopular items" do
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)

    expect(auction.unpopular_items).to eq([item2, item3, item5])

    item3.add_bid(attendee2, 15)

    expect(auction.unpopular_items).to eq([item2, item5])
  end

  it "can return items that have been bid on" do
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    expect(auction.bid_items).to eq([item1, item3, item4])

  end
  it "can return the potential revenue" do
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    expect(auction.potential_revenue).to eq(87)

  end

  it "can return the names of bidders" do
     auction.add_item(item1)
     auction.add_item(item2)
     auction.add_item(item3)
     auction.add_item(item4)
     auction.add_item(item5)
     item1.add_bid(attendee1, 22)
     item1.add_bid(attendee2, 20)
     item4.add_bid(attendee3, 50)
     item3.add_bid(attendee2, 15)


  expect(auction.bidders).to eq(["Megan", "Bob", "Mike"])

  end

  it "can return bidder info" do
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee1, 22)
    item1.add_bid(attendee2, 20)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)
    item1.close_bidding
    item1.add_bid(attendee3, 70)

    expected_hash = { attendee1 => { budget: 50, items: [item1]},
                      attendee2 => { budget: 75, items: [item1, item3]},
                      attendee3 => { budget: 100, items: [item4]}}

    expect(auction.bidder_info).to eq(expected_hash)
  end

  # xit "can return the date" do
  #   auction.add_item(item1)
  #   auction.add_item(item2)
  #   auction.add_item(item3)
  #   auction.add_item(item4)
  #   auction.add_item(item5)
  #   item1.add_bid(attendee1, 22)
  #   item1.add_bid(attendee2, 20)
  #   item4.add_bid(attendee3, 50)
  #   item3.add_bid(attendee2, 15)
  #   item1.close_bidding
  #   item1.add_bid(attendee3, 70)
  #
  #   expect(auction.date).to eq("24/02/2020")
  #
  # end
end
