# frozen_string_literal: true

require_relative "rulers/version"
require 'rulers/array'
require 'rulers/routing'

module Rulers
  class Application
    def call(env)
      `echo debug > debug.txt`;

      if env['PATH_INFO'] == '/favicon.ico'
        return [
          404,
          { 'Content-Type' => 'text/html' },
          []
        ]
      end

      if env['PATH_INFO'] == '/'
        return '/quotes/a_quote'
      end

      klass, action = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(action)

      # # Here's one way to handle errors
      # # If controller.send() returns an error
      # # we rescue it and return a 500 code with a custom error message
      # begin
      #   text = controller.send(action)
      # rescue
      #   return [
      #     500,
      #     {'Content-Type' => 'text/html'},
      #     ["You're in big, BIG trouble mister!"]
      #   ]
      # end

      [
        200,
        {'Content-Type' => 'text/html'},
        [text]
      ]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end

module Rulers
  class Error < StandardError; end
  # Your code goes here...
end
