# auction_spec.rb
require 'pry'
require 'rspec'
require './lib/item'
require './lib/attendee'
require './lib/auction'

describe 'auction' do
  it 'exists' do
  auction = Auction.new

  expect(auction).to be_an_instance_of Auction
  end

  it 'has no items by default' do
    auction = Auction.new

    expect(auction.items).to eq []
  end

  it 'can have items' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction.add_item(item1)
    auction.add_item(item2)

    expect(auction.items).to eq [item1, item2]
  end
end
