# frozen_string_literal: true

require_relative './lib/pizza_bot'

pizza_bot = PizzaBot.new()

p pizza_bot.order_pizza(gets)
