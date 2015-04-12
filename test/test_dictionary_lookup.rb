require 'minitest/autorun'
require 'dictionary_lookup'

class DictionaryLookupTest < Minitest::Test
  def test_valid_input
    results = DictionaryLookup::Base.define("hello")
    assert_instance_of Array, results
    refute_equal 0, results.length
  end

  def test_empty_string_input
    assert_equal [],
      DictionaryLookup::Base.define("")
  end
end
