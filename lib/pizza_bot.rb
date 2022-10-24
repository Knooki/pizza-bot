# frozen_string_literal: true

require_relative './parser'
require_relative './path_builder'

class PizzaBot

  def order_pizza(string)
    @field, @goals = Parser.new(string).call()

    result_str = PathBuilder.new(@field, @goals).call
  end
end
