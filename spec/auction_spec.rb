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
end 
