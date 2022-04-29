require './lib/item'
require './lib/auction'
require './lib/attendee'

describe Auction do
  describe "Iteration 1" do
    let(:auction) { Auction.new }
    let(:item1) { Item.new('Chalkware Piggy Bank') }
    let(:item2) { Item.new('Bamboo Picture Frame') }
    let(:attendee) { Attendee.new({name: 'Megan', budget: '$50'}) }

    it "exists" do
      expect(auction).to be_a Auction
    end

    it "has attributes" do
      expect(auction.items).to eq []
    end

    it "can add items" do
      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.items).to eq [item1, item2]
    end

    it "lists item names" do
      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.item_names).to eq ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
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

    it "returns a list of unpopular items" do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)

      expect(auction.unpopular_items).to eq [item2, item3, item5]
    end

    it "returns potential revenue" do
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

    it "can list bidder names"  do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee1, 22)
      item1.add_bid(attendee2, 20)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expect(auction.bidders).to eq ["Megan", "Bob", "Mike"]
    end

    it "can return bidder info in a hash"  do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee1, 22)
      item1.add_bid(attendee2, 20)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expected_hash = {
        attendee1 => {
          budget: 50,
          items: [item1]
        },
        attendee2 => {
          budget: 75,
          itemms: [item1, item3]
        },
        attendee3 => {
          budget: 100,
          itemms: [item4]
        }
      }
      expect(auction.bidder_info).to eq expected_hash
    end
  end
end
