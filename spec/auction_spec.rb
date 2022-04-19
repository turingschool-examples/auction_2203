require 'rspec'
require './lib/auction'

RSpec.describe Auction do
  describe 'object' do
    before :each do
      @auction = Auction.new
    end

    it 'has items' do
      expect(@auction.items).to eq []
    end
  end
  describe 'I1' do
    before :each do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @auction = Auction.new
    end
    it 'can list item names' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.item_names).to eq ['Chalkware Piggy Bank', 'Bamboo Picture Frame']
    end
  end

  describe 'I2' do
    before :each do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')
      @attendee1 = Attendee.new({ name: 'Megan', budget: '$50' })
      @attendee2 = Attendee.new({ name: 'Bob', budget: '$75' })
      @attendee3 = Attendee.new({ name: 'Mike', budget: '$100' })
      @auction = Auction.new
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
    end

    it 'can add bids' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@item1.current_high_bid).to eq 22
    end

    it 'can list unpopualr items' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)

      expect(@auction.unpopular_items).to eq [@item2, @item3, @item5]
    end

    it 'can list potential revenue' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq 87
    end
  end

  describe 'I3' do
    before :each do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')
      @attendee1 = Attendee.new({ name: 'Megan', budget: '$50' })
      @attendee2 = Attendee.new({ name: 'Bob', budget: '$75' })
      @attendee3 = Attendee.new({ name: 'Mike', budget: '$100' })
      @auction = Auction.new
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
    end

    it 'returns bidders' do
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.bidders).to eq %w[Megan Bob Mike]
    end

    it 'closes bids' do
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      @item1.close_bidding
      # expect(@item1.add_bid(@attendee3, 70)).to raise # not exactly sure how to test this
      expect(@item1.bids).to eq({ @attendee1 => 22, @attendee2 => 20 })
    end

    it 'returns bidder info' do
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.bidder_info).to eq({
                                           @attendee1 =>
                                             {
                                               budget: 50,
                                               items: [@item1]
                                             },
                                           @attendee2 =>
       {
         budget: 75,
         items: [@item1, @item3]
       },
                                           @attendee3 =>
      {
        budget: 100,
        items: [@item4]
      }
                                         })
    end
  end

  describe 'I4' do
    before :each do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')
      @attendee1 = Attendee.new({ name: 'Megan', budget: '$50' })
      @attendee2 = Attendee.new({ name: 'Bob', budget: '$75' })
      @attendee3 = Attendee.new({ name: 'Mike', budget: '$100' })
      @auction = Auction.new
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
    end

    it 'can tell the date' do
      expect(@auction.date).to eq '19/04/2022'
    end

    it 'can close the auction' do
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      @item5.add_bid(@attendee1, 35)

      expect(@auction.close_auction).to eq ''
    end
  end
end
