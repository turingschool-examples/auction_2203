require './lib/auction'
require 'Rspec'

describe Auction do
  context 'Iteration 1' do
    before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    end

    it 'exists' do
      expect(@auction).to be_an_instance_of(Auction)
    end

    it 'has readable attributes' do
      expect(@auction.items).to eq([])
    end

    it 'can add items to auction' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'can return a list of names for items help in it' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end
  context 'Iteration 2' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')
      @auction = Auction.new
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
    end

    it 'can return a list of items with no bid' do
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end

    it 'can return a sum of all highest bids' do
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq(87)
    end
  end
  context 'iteration 3' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')
      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
      @auction = Auction.new
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
    end

    it 'can return  list of the names of the bidders' do
      expect(@auction.bidders).to eq(["Megan", "Bob", "Mike"])
    end

    it 'can return a hash of bidder information' do

      expected = {@attendee1 => {budget: 50, items: [@item1]},
    @attendee2 => {budget: 75, items: [@item1, @item3]},
    @attendee3 => {budget: 100, items: [@item4]}}

    expect(@auction.bidder_info).to be_a(Hash)
    expect(@auction.bidder_info).to eq(expected)
    end
  end

  # context 'Iteration 4' do
  #   before(:each) do
  #     @item1 = Item.new('Chalkware Piggy Bank')
  #     @item2 = Item.new('Bamboo Picture Frame')
  #     @item3 = Item.new('Homemade Chocolate Chip Cookies')
  #     @item4 = Item.new('2 Days Dogsitting')
  #     @item5 = Item.new('Forever Stamps')
  #     @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
  #     @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
  #     @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  #     @auction = Auction.new
  #     @auction.add_item(@item1)
  #     @auction.add_item(@item2)
  #     @auction.add_item(@item3)
  #     @auction.add_item(@item4)
  #     @auction.add_item(@item5)
  #     @item1.add_bid(@attendee1, 22)
  #     @item1.add_bid(@attendee2, 20)
  #     @item4.add_bid(@attendee2, 30)
  #     @item4.add_bid(@attendee3, 50)
  #     @item3.add_bid(@attendee2, 15)
  #     @item5.add_bid(@attendee1, 35)
  #   end
  #
  #   it 'can close an auction and sell items to highest bidder' do
  #     expect(@auction.close_auction).to be_a(Hash)
  #
  #     expected = { @item1 => @attendee2,
  #     @item2 => 'Not Sold',
  #     @item3 => @attendee2,
  #     @item4 => @attendee3,
  #     @item5 => @attendee1}
  #     expect(@auction.close_auction).to eq(expected)
  #   end
  # end
end
