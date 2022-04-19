require "pry"
require "./lib/item"
require "./lib/auction"
require "./lib/attendee"

RSpec.describe Attendee do
  let(:attendee) { Attendee.new({name: "Megan", budget: "$50"}) }

  it "exists and has attributes" do
    expect(attendee).to be_a Attendee
    expect(attendee.name).to eq("Megan")
    expect(attendee.budget).to eq(50)
  end
end
