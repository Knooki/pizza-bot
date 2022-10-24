# frozen_string_literal: true

require_relative './pizza_bot'

# 5x5 (1, 3)(4, 4)
class Parser
  def initialize(string)
    @string = string
  end

  def call
    # check if given string is valid
    raise StandardError.new 'invalid string' if (/[1-9]+[xх][1-9]+\s(\([0-9]+, [0-9]+\))+/ =~ @string).nil?

    field, goals = @string.split(' ', 2)

    field = field.split(/[x,х]/).map(&:to_i)

    goals = goals.scan(/[^)]*\)/).map { |x| x[1..-2].split(', ').map(&:to_i) }

    goals.each_with_index do |goal, i|
      if goal[0] > field[0] || goal[0].negative?
        raise StandardError.new  "invalid goal(#{i + 1})"
      elsif goal[1] > field[1] || goal[1].negative?
        raise StandardError.new "invalid goal(#{i + 1})"
      end
    end

    goals.each do |goal|
      raise StandardError.new "goals can't repeat" if  goals.count(goal) > 1
    end

    PizzaBot.new(field, goals)
  end
end
