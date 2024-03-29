require_relative 'boot'
require 'csv'
require 'rails/all'
require 'pry'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Phronesis
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths << File.join(config.root, "lib")
    config.autoload_paths += %W(#{config.root}/controllers/concerns)
    # config.autoload_paths += %W(#{config.root}/lib/servicers)
    config.autoload_paths << Rails.root.join('lib/servicers')
    config.autoload_paths += Dir["#{config.root}/lib/servicers"]
  end
end
