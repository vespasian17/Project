require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Where the I18n library should search for translation files
		I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
		# Set default locale to something other than :en
		I18n.default_locale = :en
  end
end
