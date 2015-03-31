= bank-validator

bank-validator lets you validate different bank account numbers. A validated number means that the number follows the correct format has the correct checksum, which means it *could* be a real bank account. Currently supported formats are:

* IBAN
* BIC
* ABA RTN

To use bank-validator follow these simple steps:

Add to your Gemfile:

`gem 'bank-validator'`

Or:

`gem install bank-validator`

Now you can use the validations in your models.

Let's assume you have a `User` model with string columns `iban`, `bic`, and `routing_number`. To validate these fields you would simply add the following lines to your `User.rb` file:

```
validates :iban, iban: true
validates :bic, bic: true
validates :routing_number, routing_number: true
```

Now you're ready to go! 

== Contributing to bank-validator
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2015 Adam Bahlke. See LICENSE.txt for
further details.

