# Dictionary Lookup

[![Gem Version](https://badge.fury.io/rb/dictionary_lookup.svg)](http://badge.fury.io/rb/dictionary_lookup)
[![Build Status](https://travis-ci.org/nitishparkar/dictionary-lookup-rb.svg?branch=master)](https://travis-ci.org/nitishparkar/dictionary-lookup-rb)

A ruby gem that wraps [Pearson dictionary API](http://developer.pearson.com/apis/dictionaries)

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

You can specify different dictionary by passing `dictionary` in config hash. List of available dictionaries could be found [here](http://developer.pearson.com/apis/dictionaries#!//listDictionaryEntries)

```ruby
results = DictionaryLookup::Base.define("hello", {dictionary: "wordwise"})
```
