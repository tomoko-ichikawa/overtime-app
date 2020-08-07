require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Overtime
  class Application < Rails::Application
    config.load_defaults 6.0
    config.autoload_paths << Rails.root.join("lib")
  end
end
