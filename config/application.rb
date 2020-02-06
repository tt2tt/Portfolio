require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BrainShare
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.assets.paths << config.root.join("vendor/assets/javascripts")
    config.assets.paths << config.root.join("vendor/assets/stylesheets")
    config.load_defaults 5.2
    config.i18n.default_locale = :ja

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.action_view.embed_authenticity_token_in_remote_forms = true

    config.action_mailer.delivery_method = :ses
    config.action_mailer.default_url_options = { host: 'sharebrain.net' }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
