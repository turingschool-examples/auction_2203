# attendee.rb
require 'pry'
require './lib/item'

class Attendee
  attr_reader :name

  def initialize(info)
    @name = info[:name]
    @budget = info[:budget]
  end

  def budget
    @budget.slice!(0)
    @budget.to_i
  end
end
