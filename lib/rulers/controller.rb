module Rulers
  class Controller
    attr_reader :env
    def initialize(env)
      @env = env
    end

    private

    def render(view_name, locals = {})
      locals = locals.merge(
        env: env,
        debug_info: debug_info
      )

      resource_name = self.class.to_s.gsub("Controller", "").snakecase
      filename = File.join("app", "views", "#{resource_name}", "#{view_name}.html.erb")
      template = File.read(filename)

      eruby = Erubis::Eruby.new(template)
      eruby.result(locals)
    end
    
    def debug_info
      env.map do |key, value|
        "#{key} => #{value}"
      end.prepend("DEBUG_INFO").join("\n")
    end
  end
end
