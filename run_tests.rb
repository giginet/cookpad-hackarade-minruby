#!/usr/bin/env ruby
require "minruby"
require "minitest/autorun"
require_relative './interp'

$function_definitions = {}

def execute(statement)
  env = {}
  evaluate(minruby_parse(statement), env)
end

def assert_evaluation(statement)
  expected = eval(statement)
  execute(statement).must_equal expected
end

describe 'GiginyanRubyInteprter' do
  it { assert_evaluation("p(1 + 1)") }
  it { assert_evaluation("p(4 - 3)") }
  it { assert_evaluation("p(3 * 4)") }
  it { assert_evaluation("p(11 % 6 / 2)") }
  it { assert_evaluation("p(1 + 2 + 3 % 4 * 5 * 6 + 7 - 8 / 9)") }
end
