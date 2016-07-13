require 'minitest/autorun'

class TestBasicTypes < Minitest::Test
  def test_ruby_types
    h = {"hash?" => "yep, it\'s a hash!", "the answer to everything" => 42, :linux => "fun for coders."}

    assert_equal String, "Stringy string McString!".class
    assert_equal Fixnum, 1.class
    assert_equal Integer, 1.class.superclass
    assert_equal Numeric, 1.class.superclass.superclass
    assert_equal Float, 4.3.class
    assert_equal Numeric, 4.3.class.superclass
    assert_equal NilClass,  nil.class
    assert_equal Hash, h.class
    assert_equal Symbol, :symbol.class
    assert_equal Array, [].class
    assert_equal Range, (1..8).class
  end

  def test_object_and_basic_object_class
    assert_equal Object, String.superclass
    assert_equal BasicObject, Object.superclass
    assert_nil   BasicObject.superclass # only one thing has a nil superclass. what is it?
  end

  def test_ancestors
    assert_equal [Object, Minitest::Expectations, Kernel, BasicObject], Object.ancestors
  end
end

module Working
end

class Parent
  include Working
end

module GoingToSchool
end

module Playing
end

class Child < Parent
  include GoingToSchool
  include Playing
end

class TestChild < Minitest::Test
  def test_ancestors
    # Fix the order and understand why
    assert_equal [Child, Playing, GoingToSchool, Parent, Working], Child.ancestors - Object.ancestors
  end
end

