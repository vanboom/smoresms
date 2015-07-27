module SmoreSMS
  class Engine < ::Rails::Engine
    isolate_namespace SmoreSMS

    config.generators do |g|
      g.text_framework :rspec
    end
  end
end
