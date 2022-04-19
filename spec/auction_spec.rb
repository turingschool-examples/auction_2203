require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
  before :each do
    @auction = Auction.new
  end

  it 'exists and has attributes' do
    expect(@auction). to be_a Auction
    expect(@auction.items).to eq []
  end

  it 'can add auction items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.items).to eq [@item1, @item2]
  end
end
