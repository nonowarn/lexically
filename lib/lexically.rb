require "lexically/version"

# Provides `lexically` method by including this module. Methods
# defined inside of `lexically`-block have similar visibility to
# private method, But it's not called fron derived classes.
#
# @example Basic usage
#   class C
#     include Lexically
#     using lexically {
#       def lexical_method
#         :foo
#       end
#     }
#     def public_api
#       lexical_method
#     end
#   end
#
#   class D < C
#     def derived
#       lexical_method
#     end
#   end
#
#   C.new.public_api     #=> :foo
#   C.new.lexical_method #=> raises NameError
#   D.new.lexical_method #=> raises NameError because the D is derived class
module Lexically

  def self.included(base)
    base.extend(ClassMethods)
  end


  module ClassMethods

    # Returns a refinement refines the class or the module itself.
    #
    # The refinement creates its scope cannot be visible from the
    # outside of the class or the module.
    #
    # @return [Module]
    def lexically(&block)
      klass = self
      Module.new {
        refine klass, &block
      }
    end

  end
end
