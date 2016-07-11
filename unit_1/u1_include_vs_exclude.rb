require 'minitest/autorun'

module Printable
  def self.class_method_x
    # TODO: implement this to make tests pass
  end

  def instance_method_y
    # TODO: implement this to make tests pass
  end
end

class TestPrintableModule < Minitest::Test
  def test_calling_module_class_method_x
    assert_equal 'class_method_x', Printable.class_method_x
  end

  def test_calling_module_instance_method_y
    error = assert_raises(NoMethodError) { Printable.instance_method_y }
    assert_match /undefined method `instance_method_y' for Printable:Module/, error.message

    error = assert_raises(NoMethodError) { Printable.new.instance_method_y }
    assert_match /undefined method `new' for Printable:Module/, error.message
  end
end

class ExtendDocument
  # TODO: update this class to make tests pass
end

class TestExtendDocument < Minitest::Test
  def test_calling_instance_method_y
    skip
    assert_equal 'instance_method_y', ExtendDocument.instance_method_y
  end
end

class IncludeDocument
  # TODO: update this class to make tests pass
end

class TestIncludeDocument < Minitest::Test
  def test_calling_instance_method_y
    skip
    assert_equal 'instance_method_y', IncludeDocument.new.instance_method_y
  end
end

module PrintableHooked
  # TODO: implement an `included(klass)` hook that prints "included in ..."
  # AND also extend klass with instance methods in ClassMethods module
  # def ...


  module ClassMethods
    def class_method_x
      p 'class_method_x'
    end

    # TODO: implement an `extended` hook that prints "extended in"
    # def ...
  end

  def instance_method_y
    p 'instance_method_y'
  end
end

class TestIncludingPrintableHooked < Minitest::Test
  def test_including_printable_hooked
    assert_output(/included in .*\nextended in/) do
      Class.new.include(PrintableHooked)
    end
  end
end
