# frozen_string_literal: true

require "rulers/controller"
require "rulers/dependencies"
require "rulers/routing"
require "rulers/utils"
require "rulers/version"

module Rulers
  class Application
    def call(env)
      return [404, {}, []] if env['PATH_INFO'] == '/favicon.ico'

      controller_klass, action = controller_klass_and_action(env)
      [
        200,
        {'Content-Type' => 'text/html'},
        [controller_klass.new(env).send(action)]
      ]
    rescue StandardError => e
      [
        404,
        {},
        [e.message]
      ]
    end
  end
end
