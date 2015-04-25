require 'minitest/autorun'
require 'dictionary_lookup'

class DictionaryLookupTest < Minitest::Unit::TestCase
  def test_valid_input
    results = DictionaryLookup::Base.define("hello")
    assert_instance_of Array, results
    refute_equal 0, results.length
  end

  def test_empty_string_input
    assert_equal [],
      DictionaryLookup::Base.define("")
  end

  def test_different_dictionary
    results = DictionaryLookup::Base.define("hello", {dictionary: "wordwise"})
    assert_instance_of Array, results
    refute_equal 0, results.length
  end

  def test_invalid_dictionary
    results = DictionaryLookup::Base.define("hello", {dictionary: "blah"})
    assert_instance_of Array, results
    refute_equal 0, results.length
  end
end
