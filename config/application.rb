require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module NovemberQuizApi
  class Application < Rails::Application
    config.load_defaults 6.1
    config.api_only = true

    # Disable generation of helpers, assets, routing
    # and specs for helpers, routes, controller and requests
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.skip_routes true
      generate.helper_specs false
      generate.routing_specs false
      generate.controller_specs false
      generate.request_specs false
    end

    config.stripe.secret_key = Rails.application.credentials.dig(:stripe, :secret_key)
    config.stripe.publishable_key = Rails.application.credentials.dig(:stripe, :publishable_key)

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 methods: %i[get post put delete],
                 expose: %w[access-token expiry token-type uid client],
                 max_age: 0
      end
    end
  end
end
