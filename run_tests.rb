require "minruby"
require "minitest/autorun"
require_relative './interp'

$function_definitions = {}

def exec(statement)
  env = {}
  evaluate(minruby_parse(statement), env)
end

describe 'GiginyanRubyInteprter' do
  describe "when asked about cheeseburgers" do
    it "must respond positively" do
      exec("p(1 + 1)").must_equal 2
    end
  end
end
