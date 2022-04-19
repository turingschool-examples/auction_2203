require "pry"
require "./lib/item"
require "./lib/auction"
require "./lib/attendee"

RSpec.describe Auction do
  let(:item1) { Item.new("Chalkware Piggy Bank") }
  let(:item2) { Item.new("Bamboo Picture Frame") }
  let(:attendee) { Attendee.new({name: "Megan", budget: "$50"}) }
  let(:auction) { Auction.new }

  it "exists and has attributes" do
    expect(auction).to be_a Auction
    expect(auction.items).to eq([])
  end

  it "can add and store items" do
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.items).to eq([item1, item2])
  end

  it "can list items by name" do
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end
end
