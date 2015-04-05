require "dictionary_lookup/pearson"

module DictionaryLookup
  class Base
    def self.define(term)
      Pearson.define(term)
    end
  end
end
