require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Attendee do
  let(:attendee1) {Attendee.new({name: 'Megan', budget: '$50'})}
  let(:attendee2) {Attendee.new({name: 'Bob', budget: '$75'})}
  let(:attendee3) {Attendee.new({name: 'Mike', budget: '$100'})}

  it 'exists' do
    expect(attendee1).to be_a(Attendee)
  end

  it 'has attributes' do
    expect(attendee1.name).to eq("Megan")
    expect(attendee1.budget).to eq(50)
  end
end
