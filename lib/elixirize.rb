require "elixirize/version"

module Elixirize
  ::Object.class_eval do
    def ᐅ other, *args
      other.call(self, *args)
    end
  end
end
