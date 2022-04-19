require "./lib/attendee"
require "rspec"

RSpec.describe Attendee do
  describe "Iteration 1" do
    it "exists" do
      attendee = Attendee.new({name: 'Megan', budget: '$50'})
      expect(attendee).to be_a Attendee
    end

    it "has readable attributes" do
      attendee = Attendee.new({name: 'Megan', budget: '$50'})
      expect(attendee.name).to eq 'Megan'
      expect(attendee.budget).to eq '$50'
    end
  end
end
