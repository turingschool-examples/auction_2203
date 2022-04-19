class Attendee

  attr_reader :name,
              :budget

  def initialize(atributes)
    @name = atributes[:name]
    @budget = atributes[:budget].slice(1..).to_i
  end



end
