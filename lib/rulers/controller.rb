module Rulers
  class Controller
    attr_reader :env
    def initialize(env)
      @env = env
    end

    private
    
    def debug_info
      env.map do |key, value|
        "#{key} => #{value}"
      end.prepend("DEBUG_INFO").join("\n")
    end
  end
end
