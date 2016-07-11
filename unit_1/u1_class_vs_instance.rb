require 'minitest/autorun'

class MyClass
  @@one = "one"
  @two = "two"
  class << self
    attr_accessor :three
  end

  def self.method1
  end

  def method2
  end
end

# Task 1: write at least 4 methods
class TestMyClass < MiniTest::Test
  def test_class_variables
    # please list the names of the class variables here
    skip
    assert_equal [], MyClass.class_variables
  end

  def test_instance_variables
    skip
    assert_equal [], MyClass.instance_variables
  end

  def test_instance_methods
    skip
    assert_equal [], MyClass.instance_methods(false)
    assert_equal [], MyClass.instance_methods - Object.methods
  end

  def test_class_methods
    skip
    assert_equal [], MyClass.methods(false)
  end
end
