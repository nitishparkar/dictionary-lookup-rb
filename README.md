# Dictionary Lookup

A ruby gem that wraps pearson dictionary API

## Getting started

You can add it to your Gemfile with:

```ruby
gem 'dictionary_lookup'
```
or

You can install it directly

    gem install dictionary_lookup

and then require it

    require 'dictionary_lookup'

## Usage

You can lookup a word definition by:

```ruby
results = DictionaryLookup::Base.define("hello")
```

results will contain an array of DictionaryLookup::Definition objects.
```ruby
results.count # => 1
results.first.part_of_speech # => "noun"
results.first.denotation # => "used as a greeting when you see or meet someone"
results.first.examples # => ["Hello, John! How are you?"]
```
