module Rulers
  class ::Object
    def self.const_missing(c)
      require c.to_s.snakecase
      Object.const_get(c)
    end
  end
end
