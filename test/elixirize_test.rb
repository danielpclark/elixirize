require 'test_helper'

def divide a, b
  a/b
end

class ElixirizeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Elixirize::VERSION
  end

  def test_it_can_pass_previous_results_to_next_item
    add = ->a, b{a+b}
    subtract = ->a, b{a-b}
    assert_equal -6, add.(4, 5).ᐅ(subtract, 15)
  end

  def test_it_takes_procd_method
    add = ->a, b{a+b}
    assert_equal 5, add.(40, 60).ᐅ(method(:divide), 20)
  end
end
