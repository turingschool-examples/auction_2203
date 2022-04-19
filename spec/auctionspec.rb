require 'rspec'
require './lib/auction'
require './lib/attendee'
require './lib/item'

describe Auction do
  before(:each) do
    @auction = Auction.new
  end

  it "is an instance of auction" do
    expect(@auction).to be_an_instance_of(Auction)
  end

  it "has no items by default" do
    expect(@auction.items).to eq([])
  end

  it "can add items to be acutioned" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    @auction.add_item(item1)
    @auction.add_item(item2)
    expect(@auction.items).to eq([item1, item2])
  end

  it "can tell us the names of the items" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    @auction.add_item(item1)
    @auction.add_item(item2)
    expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])\
  end
end
