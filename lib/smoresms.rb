require "yaml"
require "action_mailer"
require "active_model"
require "smoresms/version"
require "bundler/cli"

require "validates_phone_number"
require "smoresms/sms"
require "smoresms/smoresms_helper"
GEM_ROOT = File.expand_path("../..", __FILE__)

ActionController::Base.helper SmoreSMS::Helpers
