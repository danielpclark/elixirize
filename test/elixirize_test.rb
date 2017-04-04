require 'test_helper'

def divide a, b
  a / b
end

class ElixirizeTest < Minitest::Test
  def test_it_can_pass_previous_results_to_next_item
    add = ->a, b{ a + b }
    subtract = ->a, b{ a - b }
    assert_equal(-6, add.(4, 5).ᐅ(subtract, 15))
  end

  def test_it_takes_procd_method
    add = ->a, b{ a + b }
    assert_equal 5, add.(40, 60).ᐅ(method(:divide), 20)
  end

  def test_lamda
    multiply = λ {|a, b| a * b }
    assert_equal 4, multiply.call(2, 2)
  end

  def test_symbol_trickery
    s = "a b c d"
    val = s.
      ᐅ ~:split, " "
    assert_equal ["a", "b", "c", "d"], val
  end

  def test_chain_example_with_tilde
    s = "a b c d"
    val = s.
      ᐅ(~:split, " ").
      ᐅ(~:join, "-").
      ᐅ ~:capitalize
    assert_equal "A-b-c-d", val
  end

  def test_chain_example_with_to_proc
    s = "a b c d"
    val = s.
      ᐅ(:split.to_proc, " ").
      ᐅ(:join.to_proc, "-").
      ᐅ :capitalize.to_proc
    assert_equal "A-b-c-d", val
  end

  def test_multiple_arguments_on_proc
    result = "passes".
      ᐅ ~:gsub, 's', 'z'
    assert_equal "pazzez", result

    result = "passes".
      ᐅ :gsub.to_proc, 's', 'z'
    assert_equal "pazzez", result
  end

  def test_pipe_method_with_block
    sentance = "The rain in Spain stays mainly in the plain"
    ai = ->(s) { s['ai']}
    result = sentance.
      ᐅ(~:split).
      ᐅ ~:select, &ai
    assert_equal ["rain", "Spain", "mainly", "plain"], result

    aie = ->(enum) { enum.each(&ai) }
    result2 = sentance.
      ᐅ(~:split).
      ᐅ(~:select).
      ᐅ aie
    assert_equal ["rain", "Spain", "mainly", "plain"], result2
  end
end
