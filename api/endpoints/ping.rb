# frozen_string_literal: true

module Api
  module Endpoints
    class Ping < Grape::API
      namespace :ping do
        desc 'Returns pong'
        get do
          { ping: 'pong' }
        end
      end
    end
  end
end
