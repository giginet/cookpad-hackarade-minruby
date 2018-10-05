#!/usr/bin/env ruby
require "minruby"
require "minitest/autorun"
require_relative './interp'

$function_definitions = {}

def exec(statement)
  env = {}
  evaluate(minruby_parse(statement), env)
end

describe 'GiginyanRubyInteprter' do
  it { exec("p(1 + 1)").must_equal 2 }
end
