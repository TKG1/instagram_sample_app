require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstagramSampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # 言語ファイルを階層ごとに設定するための記述
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    # デフォルト言語
    config.i18n.default_locale = :ja
    # タイムーゾンの設定
    config.time_zone = 'Tokyo'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # 作成時の不要なファイルを設定
    config.generators do |g|  # ここから追記
      g.assets false          # CSS, JavaScriptファイル生成せず
      g.helper false
      g.skip_routes true    # trueならroutes.rb変更せず、falseなら通常通り変更
      g.test_framework false  # testファイル生成せず
    end                       
  end
end
