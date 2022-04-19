class Attendee
  attr_reader :name,
              :budget
  def initialize(argument)
    @name = argument[:name]
    @budget = argument[:budget].delete("$").to_i
  end
end
