class Attendee

  attr_reader :stuff, :name, :budget

  def initialize(stuff)
    @stuff = stuff
    # @name = name
    # @budget = budget
  end

  def name
    @stuff.fetch(:name)
  end

  def budget
    @stuff.fetch(:budget)
  end

end
