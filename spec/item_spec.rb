require "pry"
require "./lib/item"
require "./lib/auction"
require "./lib/attendee"

RSpec.describe Item do
  let(:item1) { Item.new("Chalkware Piggy Bank") }
  let(:item2) { Item.new("Bamboo Picture Frame") }

  it "exists and has attributes" do
    expect(item1).to be_a Item
    expect(item1.name).to eq("Chalkware Piggy Bank")
  end

  describe "Iteration 2" do
    let(:item1) { Item.new("Chalkware Piggy Bank") }
    let(:item2) { Item.new("Bamboo Picture Frame") }
    let(:attendee) { Attendee.new({name: "Megan", budget: "$50"}) }
    let(:auction) { Auction.new }
    let(:item3) { Item.new("Homemade Chocolate Chip Cookies") }
    let(:item4) { Item.new("2 Days Dogsitting") }
    let(:item5) { Item.new("Forever Stamps") }
    let(:attendee1) { Attendee.new({name: "Megan", budget: "$50"}) }
    let(:attendee2) { Attendee.new({name: "Bob", budget: "$75"}) }
    let(:attendee3) { Attendee.new({name: "Mike", budget: "$100"}) }
    before :each do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
    end

    it "can track and add attendee bids" do
      expect(item1.bids).to eq({})

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
    end
  end
end
