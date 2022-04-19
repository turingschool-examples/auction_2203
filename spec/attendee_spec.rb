require './lib/attendee'
require './lib/item'


describe Attendee do
  let(:attendee){Attendee.new({name: 'Megan', budget: '$50'})}
  let(:item1){Item.new('Chalkware Piggy Bank')}
  let(:item2){Item.new('Bamboo Picture Frame')}

  it 'exits' do
    expect(attendee).to be_an(Attendee)
  end

  it "has readable attributes" do
    expect(attendee.name).to eq('Megan')
    expect(attendee.budget).to eq(50)
  end
end
