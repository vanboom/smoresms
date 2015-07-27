# SmoreSMS

This gem provides an easy, clean interface to sending SMS messages from your
rails application.  SMS messages can be "delivered" immediately, or "delayed"
if you are using Sidekiq.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smoresms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smoresms

## Usage

SmoreSMS simply formats an email "to" address which you can use in your mailer
to send text messages from your Rails application.  Don't get fooled by other
poorly implemented solutions like SmsFu that try to deliver the email for you.
Keep it simple!


## Contributing

1. Fork it ( https://github.com/vanboom/smoresms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
