require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #DBの保存時間を変更する
    config.active_record.default_timezone = :local

    #バリデーションエラーの日本語化
    config.i18n.default_locale = :ja
    #config/locales以下のディレクトリ内にある全てのymlファイルを読み込むように指示する一文
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'models', '*.yml').to_s]
  end
end

