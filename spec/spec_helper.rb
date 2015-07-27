require 'smoresms'

ActionMailer::Base.perform_deliveries = false
ActionMailer::Base.delivery_method = :test
I18n.enforce_available_locales = false

RSpec.configure do |config|
  config.filter_run :focus=>true
  config.run_all_when_everything_filtered = true
end

ActionMailer::Base.configure do |config|
  config.default_options = {:from=>"test@smoresms.com", :reply_to=>"test@smoresms.com"}
  config.perform_deliveries = false
  config.delivery_method = :test
end
