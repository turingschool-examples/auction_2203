require './lib/item'
require './lib/auction'
require './lib/attendee'

describe Auction do
  let(:item1){Item.new('Chalkware Piggy Bank')}
  let(:item2){Item.new('Bamboo Picture Frame')}
  let(:item3){Item.new('Homemade Chocolate Chip Cookies')}
  let(:item4){Item.new('2 Days Dogsitting')}
  let(:item5){Item.new('Forever Stamps')}
  let(:attendee1){Attendee.new({name: 'Megan', budget: '$50'})}
  let(:attendee2){Attendee.new({name: 'Bob', budget: '$75'})}
  let(:attendee3){Attendee.new({name: 'Mike', budget: '$100'})}
  let(:auction){Auction.new}

  it 'exits' do
    expect(auction).to be_an(Auction)
  end

  it "has an items array and can add items to that array" do
    expect(auction.items).to eq([])
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.items).to eq([item1, item2])
  end

  it 'can return the names of the items in items array' do
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

  it 'can recieve bids on items and show all bids' do
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    expect(item1.bids).to eq({})
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
    end

    it 'can return the highest bid for an item' do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.current_high_bid).to eq(22)
    end

    it 'can return the items without bids' do
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

    it 'can return a potential revenue' do
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

    it 'can return an array of the names of bidders that have placed a bid' do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee1, 22)
      item1.add_bid(attendee2, 20)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)
      expect(auction.bidders).to eq(['Megan', 'Bob', 'Mike'])
    end

    it 'can close bidding on an item' do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee1, 22)
      item1.add_bid(attendee2, 20)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)
      expect(item1.bids).to eq({attendee1 => 22, attendee2 => 20})
      item1.close_bidding
      item1.add_bid(attendee3, 70)
      expect(item1.bids).to eq({attendee1 => 22, attendee2 => 20})
    end

    it 'can return bidder info hash' do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee1, 22)
      item1.add_bid(attendee2, 20)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)
      expect(auction.bidder_info).to eq({
        attendee1 => {:budget => 50, :items => [item1]},
        attendee2 => {:budget => 75, :items => [item2, item3]},
        attendee3 => {:budget => 100, :items => [item4]}})
      end
  end
