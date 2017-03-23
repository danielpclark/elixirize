require "elixirize/version"

module Elixirize
  # add(4,5).ᐅ :minus, 15

  ::Object.class_eval do
    def ᐅ other, *args
      other.call(*args, self)
    end
  end
end
