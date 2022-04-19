require 'rspec'
require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe do Item
  it "creates item" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1).to be_an_instance_of(Item)
  end

  it "item has name" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.name).to eq('Chalkware Piggy Bank')
  end

  it "item has empty bids" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.bids).to eq({})
  end

  it "item can add bid" do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    bids_hash = {attendee2 => 20, attendee1 => 22}
    expect(item1.bids).to eq(bids_hash)
  end

  it "item can get high bid" do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    expect(item1.current_high_bid).to eq(22)
  end

  it "item gets highest bid" do
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
    expect(item1.current_high_bid).to eq(22)
  end

  it "item can close bids" do
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
    bids_hash = {attendee1 => 20, attendee2 => 22}
    expect(item1.bids).to eq(bids_hash)
    item1.close_bidding
    item1.add_bid(attendee3, 70)
    expect(item1.bids).to eq(bids_hash)
  end

end
