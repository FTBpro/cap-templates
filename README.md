# Cap::Templates

Capistrano plugin that resolved .erb files on deploy

## Installation

Add this line to your application's Gemfile:

    gem 'cap-templates'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cap-templates

## Usage

In your `deploy.rb` you should:

1. require `cap-templates`
2. set the `erb_templates` variable.

A typical deploy file might look like this:

```ruby
require 'cap-templates'
set :erb_templates, ['nginx/configuration.erb' ,'unicorn.rb.erb']
```

Files inside `erb_templates` are relative to your `root_path/config/` directory.
They will be resolved to the filename with the .erb extention omitted.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
