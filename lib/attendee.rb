class Attendee
  attr_reader :name,
              :budget

  def initialize(attribute)
    @name = attribute[:name]
    @budget = attribute[:budget].delete("'$'").to_i
  end

end
