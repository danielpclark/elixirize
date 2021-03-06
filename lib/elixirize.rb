require "elixirize/version"

module Elixirize
  ::Object.class_eval do

    def ᐅ other, *args, &block
      other.call(self, *args, &block)
    end

    alias_method :λ, :lambda
  end

  ::Symbol.class_eval do
    alias_method :~, :to_proc
  end
end
