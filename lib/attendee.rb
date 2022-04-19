class Attendee
  attr_reader :name,
              :budget

  def initialize(name)
    @name = name
    @budget = 0
  end
end
