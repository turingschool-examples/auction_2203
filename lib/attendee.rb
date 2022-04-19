class Attendee

  attr_reader :stuff, :name, :budget
#I struggled so much with this class and the tragic thing is it was because I was thinking too hard
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
