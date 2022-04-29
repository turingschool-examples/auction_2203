require './lib/item'
require './lib/auction'
require './lib/attendee'

describe Item do
  describe "Iteration 1" do
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
  end

  describe "Iteration 2" do
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

    it "can return highest bid amount" do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee1, 22)
      item1.add_bid(attendee2, 20)

      expect(item1.current_high_bid).to eq(22)
    end
  end

  describe "Iteration 3" do
    let(:item1) { Item.new('Chalkware Piggy Bank') }
    let(:item2) { Item.new('Bamboo Picture Frame') }
    let(:item3) { Item.new('Homemade Chocolate Chip Cookies') }
    let(:item4) { Item.new('2 Days Dogsitting') }
    let(:item5) { Item.new('Forever Stamps') }
    let(:attendee1) { Attendee.new({name: 'Megan', budget: '$50'}) }
    let(:attendee2) { Attendee.new({name: 'Bob', budget: '$75'}) }
    let(:attendee3) { Attendee.new({name: 'Mike', budget: '$100'}) }
    let(:auction) { Auction.new }

    it "closing bid updates the item so that it will not accept additional bids"  do
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

      expected = {
        attendee2 => 20,
        attendee1 => 22
      }
      expect(item1.bids).to eq(expected)
    end
  end
end
