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
  describe 'test 1' do
    it { assert_evaluation("1 + 1") }
    it { assert_evaluation("4 - 3") }
    it { assert_evaluation("3 * 4") }
    it { assert_evaluation("11 % 6 / 2") }
    it { assert_evaluation("1 + 2 + 3 % 4 * 5 * 6 + 7 - 8 / 9") }
  end

  describe 'test 2' do
    it do 
      assert_evaluation('1')
      assert_evaluation('2')
      assert_evaluation('3') 
    end

    it do
      assert_evaluation(
          <<-EOS
x = 42
p(x)
      EOS
      )
    end

    it do
      assert_evaluation(
          <<-EOS
      x = 8 * 5
      y = x + 2
      p(y)
      EOS
)
    end
  end
end
