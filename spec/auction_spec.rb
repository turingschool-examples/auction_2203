require './lib/auction'
RSpec.describe Auction do

  it 'exists' do
    auction = Auction.new
    expect(auction).to be_a(Auction)
  end

  it 'has attributes' do
    auction = Auction.new
    expect(auction.items).to eq([])
  end

end
