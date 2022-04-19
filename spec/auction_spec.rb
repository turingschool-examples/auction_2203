require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  before :each do

    @auction = Auction.new
  end

  it "exists" do

    expect(@auction).to be_a(Auction)
  end

  it "has attributes" do

    expect(@auction.items).to eq([])
  end

  describe 'Adding Items' do
    before :each do

      @auction.add_item(@item1)
      @auction.add_item(@item2)
    end

    it "can add items" do

    end
  end
end
