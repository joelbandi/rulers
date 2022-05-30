module Rulers
  class Application
    def controller_klass_and_action(env)
      _empty, controller, action, after =
            env["PATH_INFO"].split('/', 4)

      controller = controller.capitalize + "Controller"

      [
        Object.const_get(controller),
        action.to_sym
      ]
    end
  end
end
