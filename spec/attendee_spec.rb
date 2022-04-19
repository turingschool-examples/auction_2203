# attendee_spec.rb
require 'pry'
require 'rspec'
require './lib/item'
require './lib/attendee'

describe 'attendee' do
  it 'exists' do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})

    expect(attendee).to be_an_instance_of Attendee
  end

  it 'has attributes' do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})

    expect(attendee.name).to eq 'Megan'
    expect(attendee.budget).to eq(50)
  end
end
