require "test_helper"

class LexicallyTest < Minitest::Test
  class TestClass
    include Lexically

    using lexically {
      def lexical_method
        :lexical
      end
    }

    def call_lexical_method
      lexical_method
    end
  end

  class TestDerivedClass < TestClass
    def call_parent_lexical_method
      lexical_method
    end
  end

  def test_method_can_call_lexically_defined_method
    assert_equal :lexical, TestClass.new.call_lexical_method
  end

  def test_lexcally_defined_method_cannot_be_called_from_outside
    err = assert_raises NameError do
      TestClass.new.lexical_method
    end
    assert_includes err.message, "undefined method `lexical_method'"
  end

  def test_lexically_defined_method_cannot_be_called_fron_derived_class
    err = assert_raises NameError do
      TestDerivedClass.new.lexical_method
    end
    assert_includes err.message, "undefined method `lexical_method'"
  end

end
