require './lib/item'
require './lib/attendee'

RSpec.describe Attendee do
  it 'exist' do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
  expect(attendee).to be_an_instance_of(Attendee)
  end
end
