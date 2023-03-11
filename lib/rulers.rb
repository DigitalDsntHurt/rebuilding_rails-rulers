# frozen_string_literal: true

require_relative "rulers/version"
require 'rulers/array'
require 'rulers/routing'
require_relative 'rulers/file_paths'

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


      # # Here's one approach to handling the root route
      # # this approach passes in a dummy env object {"PATH_INFO"=>"/quotes/a_quote"}
      # # which results in '/' rendering '/quotes/a_quote'
      # if env['PATH_INFO'] == '/'
      #   klass, action = get_controller_and_action({"PATH_INFO"=>"/quotes/a_quote"})
      #   controller = klass.new(env)
      #   text = controller.send(action)
      #   return [
      #     200,
      #     { 'Content-Type' => 'text/html' },
      #     [text]
      #   ]
      # end

      # Here's another approach to handling the root route
      # This time we create an html file in public/html and read it in from the response
      if env['PATH_INFO'] == '/'
        return [
          200,
          { 'Content-Type' => 'text/html' },
          [Rulers::FilePaths.public_html]
        ]
      end
      
      klass, action = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(action)

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
