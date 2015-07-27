require "yaml"
require "action_mailer"
require "active_model"
require "smoresms/version"
require "bundler/cli"

require "validates_phone_number"
require "smoresms/sms"

GEM_ROOT = File.expand_path("../..", __FILE__)

# console test
#s = SmoreSMS::SMS.new(:number=>"3142778090", :carrier=>"verizon", :from=>"test@smoresms.com", :name=>"SmoreSMS Tester")
#s.deliver("test", "test")
