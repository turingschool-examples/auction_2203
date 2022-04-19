require 'rspec'
require './lib/auction'
require './lib/item'
require './lib/attendee'

RSpec.describe do Auction
  it "auction exists" do
    auction = Auction.new
    expect(auction).to be_an_instance_of(Auction)
  end

  it "auction has items" do
    auction = Auction.new
    expect(auction.items).to eq([])
  end

  it "auction can add items" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.items).to eq([item1, item2])
  end

  it "auction can display names" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.items_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
  end

  it "auction gets unpopular items" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)
    expect(auction.unpopular_items).to eq([item2 , item3, item5])
  end

  it "auction gets potential revenue" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    auction = Auction.new
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

  it "auction has bidders" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee1, 20)
    item1.add_bid(attendee2, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)
    expect(auction.bidders).to eq(['Megan', 'Bob', 'Mike'])
  end

  it "auction has bidders info" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee1, 20)
    item1.add_bid(attendee2, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)
    bids_hash = {attendee1 => {budget: attendee1.budget}}
    expect(auction.bidder_info).to eq(bids_hash)
  end
end
