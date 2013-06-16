# assemblabla

[![Gem Version](https://badge.fury.io/rb/assemblabla.png)](http://badge.fury.io/rb/assemblabla)
[![Code Climate](https://codeclimate.com/github/GeneralScripting/assemblabla.png)](https://codeclimate.com/github/GeneralScripting/assemblabla)

## Installation

    gem install assemblabla

Or in your Gemfile:

    gem 'assemblabla'

## Usage

    require 'assemblabla'
    
    client = Assembla::Client.new(YOUR_KEY, YOUR_SECRET)
    
    client.spaces
    # returns the ActiveResource: Space
    # see https://github.com/rails/activeresource#configuration-and-usage
    
    # find(:first) is broken :(
    space_id = client.spaces.find(:all).first.id
    
    client.tickets( space_id )
    # returns the ActiveResource: Ticket
    # (ugly, but necessary until ActiveResource supports has_many etc.)
    
    client.milestones( space_id )
    # returns the ActiveResource: Milestone
    
That is all for now. Please help creating the other [Assembla API methods](http://api-doc.assembla.com/content/api_reference.html).


## Contributing to assembla
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

This gem is released under the [MIT License](http://www.opensource.org/licenses/MIT).

