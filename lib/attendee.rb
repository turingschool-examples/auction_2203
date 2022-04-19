class Attendee
  attr_reader :name,
              :budget,
              :info

  def initialize(input)
    @info = input
    @name = input[:name]
    @budget = input[:budget]
  end
end
