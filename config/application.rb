require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'


Bundler.require(*Rails.groups)

module Paindiary
  class Application < Rails::Application
    #config.assets.enabled = true
    config.autoload_paths += %W(#{config.root}/lib)
    #config.assets.version = '1.0'
    config.assets.precompile += (Dir.glob(File.join(Rails.root, 'app/assets/stylesheets/*')).map{ |p| File.basename(p).gsub(/(\.css)?.s[a|c]ss$/, '.css')})
    config.exceptions_app = self.routes
  end
end
