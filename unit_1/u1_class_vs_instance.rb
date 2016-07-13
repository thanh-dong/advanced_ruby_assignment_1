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
    assert_equal [:@@one], MyClass.class_variables
  end

  def test_instance_variables
    assert_equal [:@two], MyClass.instance_variables
  end

  def test_instance_methods
    assert_equal [:method2], MyClass.instance_methods(false)
    assert_equal [:method2], MyClass.instance_methods - Object.methods
  end

  def test_class_methods
    assert_equal [:three, :three=, :method1], MyClass.methods(false)
  end
end
