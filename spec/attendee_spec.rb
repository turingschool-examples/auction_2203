require 'rspec'
require './lib/attendee'

RSpec.describe do Attendee
  it "attendee exists" do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    expect(attendee).to be_an_instance_of(Attendee)
  end

  it "attendee has name" do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    expect(attendee.name).to eq('Megan')
  end

  it "attendee has budget" do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    expect(attendee.budget).to eq(50)
  end
end
