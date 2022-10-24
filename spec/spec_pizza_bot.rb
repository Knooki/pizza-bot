# frozen_string_literal: true

require_relative 'spec_helper'

# Parser  5x5 (1, 3)(4, 4) returns PizzaBot object if valid
#                         returns invalid if given string is invalid
# PizzaBot check if constructor works correctly.
# PathBuilder

require_relative '../lib/parser'
require_relative '../lib/pizza_bot'
require_relative '../lib/path_builder'

RSpec.describe Parser do
  let(:parser) do
    Parser.new('5x5 (1, 3)(4, 4)')
  end

  let(:invalid_str_parser) do
    Parser.new('5x5 (6,3)(5, 4)')
  end

  let(:invalid_goal_parser) do
    Parser.new('5x2 (5, 3)(5, 4)')
  end

  let(:invalid_repeated_goal_parser) do
    Parser.new('5x5 (5, 3)(3, 5)(3, 5)')
  end

  context 'invalid string given' do
    it { expect{invalid_str_parser.call}.to raise_error(StandardError, 'invalid string') }
  end

  context 'invalid goal given' do
    it { expect{invalid_goal_parser.call}.to raise_error(StandardError, 'invalid goal(1)') }
  end

  context 'repeated goals given' do
    it { expect{invalid_repeated_goal_parser.call}.to raise_error(StandardError, "goals can't repeat") }
  end

  context 'valid string given' do
    it { expect(parser.call) == PizzaBot.new([5, 5], [[1, 3], [4, 4]]) }
  end
end

RSpec.describe PizzaBot do
end

RSpec.describe PathBuilder do
end
