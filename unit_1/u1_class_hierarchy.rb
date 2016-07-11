require 'minitest/autorun'

class TestBasicTypes < Minitest::Test
  def test_ruby_types
    h = {"hash?" => "yep, it\'s a hash!", "the answer to everything" => 42, :linux => "fun for coders."}

    skip
    # TODO: change TBI (To Be Implemented) to the correct constant names
    assert_equal TBI, "Stringy string McString!".class
    assert_equal TBI, 1.class
    assert_equal TBI, 1.class.superclass
    assert_equal TBI, 1.class.superclass.superclass
    assert_equal TBI, 4.3.class
    assert_equal TBI, 4.3.class.superclass
    assert_equal TBI,  nil.class
    assert_equal TBI, h.class
    assert_equal TBI, :symbol.class
    assert_equal TBI, [].class
    assert_equal TBI, (1..8).class
  end

  def test_object_and_basic_object_class
    skip
    # TODO: change TBI (To Be Implemented) to the correct constant names
    assert_equal TBI, String.superclass
    assert_equal TBI, Object.superclass
    assert_nil   TBI.superclass # only one thing has a nil superclass. what is it?
  end

  def test_ancestors
    # TODO: fix to include necessary modules and classes
    assert_equal [], Object.ancestors
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
    assert_equal [Child, Parent, Playing, GoingToSchool, Working], Child.ancestors - Object.ancestors
  end
end

