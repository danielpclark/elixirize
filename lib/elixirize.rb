require "elixirize/version"

module Elixirize
  ::Object.class_eval do

    def ᐅ other, *args
      other.call(self, *args)
    end

    alias_method :λ, :lambda
  end

  ::Symbol.class_eval do
    def ~
      λ {|obj, *args| obj.send self, *args }
    end
  end
end
