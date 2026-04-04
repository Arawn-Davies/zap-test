require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ZapTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Security headers added to every Rails-generated response.
    config.action_dispatch.default_headers.merge!(
      "Cross-Origin-Opener-Policy"   => "same-origin",
      "Cross-Origin-Embedder-Policy" => "require-corp",
      "Cross-Origin-Resource-Policy" => "same-origin",
      "Permissions-Policy"           => "camera=(), geolocation=(), microphone=(), payment=(), usb=()"
    )

    # Security headers for static files served by the public file server.
    STATIC_SECURITY_HEADERS = {
      "X-Content-Type-Options"       => "nosniff",
      "Cross-Origin-Resource-Policy" => "same-origin"
    }.freeze
  end
end
