require 'minitest/autorun'
require 'dictionary_lookup'

class DictionaryLookupTest < Minitest::Test
  def test_hi
    assert_equal "Hello, world!",
      DictionaryLookup.hi
  end
end
