require 'minitest/autorun'

module Printable
  def self.class_method_x
    'class_method_x'
  end

  def instance_method_y
    'instance_method_y'
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
  extend Printable
end

class TestExtendDocument < Minitest::Test
  def test_calling_instance_method_y
    assert_equal 'instance_method_y', ExtendDocument.instance_method_y
  end
end

class IncludeDocument
  include Printable
end

class TestIncludeDocument < Minitest::Test
  def test_calling_instance_method_y
    assert_equal 'instance_method_y', IncludeDocument.new.instance_method_y
  end
end

module PrintableHooked
  def self.included(base)
    puts "included in #{base.class}\n"
    base.extend(ClassMethods)
  end

  module ClassMethods
    def class_method_x
      p 'class_method_x'
    end

    def self.extended(base)
      puts "extended in"
    end
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
