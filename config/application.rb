require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsGraphQL
  class Application < Rails::Application
    config.api_only = true

    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.test_framework :rspec, fixture: false
      g.view_specs false
      g.helper_specs false
    end

    config.autoload_paths += %W(
      #{config.root}/app/graph
      #{config.root}/app/graph/types
      #{config.root}/app/graph/queries
      #{config.root}/app/graph/fields
    )

    config.middleware.insert_before 0, "Rack::Cors" do
       allow do
         origins 'localhost:3000'

         resource '*',
           headers: :any,
           methods: [:get, :post, :put, :patch, :delete, :options, :head]
       end
     end
  end
end
