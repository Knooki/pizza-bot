# frozen_string_literal: true

require_relative './lib/parser'
require_relative './lib/path_builder'

parser = Parser.new(gets)

path_builder = PathBuilder.new(parser.call)

path_builder.call
