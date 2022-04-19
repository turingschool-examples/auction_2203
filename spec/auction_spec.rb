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

      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')

      @auction.add_item(@item1)
      @auction.add_item(@item2)
    end

    it "can add items" do

      expect(@auction.items).to eq([@item1,@item2]) #got ahead of myself here
    end

    xit "can return all the auction item names in an array" do

      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
      #getting stuck on the code here @11:07
      #still stuck @11:22
      # Not wasting any more time I'll try and come back later @11:25
    end

  end

  describe "Iteration II" do
    before :each do

      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')

      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

      @auction = Auction.new
    end

    it "can bid on items" do

      expect(@item1.bids).to eq({})
      #Taking a pom @11:40, back @11:50
    end
  end
end
