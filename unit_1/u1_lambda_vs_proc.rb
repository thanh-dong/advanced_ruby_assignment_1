require 'minitest/autorun'

class TestLambdaProcDifferences < Minitest::Test
  def setup
    @lambda = lambda {|x| puts("I'm lambda taking 1 argument"); x } # you can also use the arrow syntax: -> (x) { }
    @proc   = Proc.new {|x| puts("I'm proc taking 1 argument"); x }
  end

  def test_class_name
    # TODO: change TBI to the correct values
    assert_equal "TBI", @lambda.class.name
    assert_equal "TBI", @proc.class.name
  end

  def test_arity_of_lambda
    assert_equal "TBI", @lambda.call("hello")

    error = assert_raises(ArgumentError) { @lambda.call }
    assert_equal "wrong number of arguments (given ..., expected 1)", error.message

    error = assert_raises(ArgumentError) { @lambda.call("one", "two") }
    assert_equal "wrong number of arguments (given ..., expected 1)", error.message
  end

  def test_arity_of_proc
    assert_equal "TBI", @proc.call("hello")
    assert_equal "TBI", @proc.call("hello", "world")
    assert_nil @proc.call # A free passing test! :)
  end

  def test_return_keyword_in_lambda
    def lambda_caller
      lam = -> { puts("lambda executed"); return }
      # TODO: call lambda here
      # ...
      puts "end of lambda_caller executed"
    end

    assert_output /lambda executed.*end_of_lambda caller executed/ do
      lambda_caller
    end
  end

  def test_return_keyword_in_proc
    def proc_caller
      proc = Proc.new { return 'VALUE' }
      # TODO: call prochere
      # ...
      # TODO: insert a `raise 'not run'` statement below
      # to prove that the statement doesn't execute
    end

    assert_equal 'VALUE', proc_caller
  end
end
