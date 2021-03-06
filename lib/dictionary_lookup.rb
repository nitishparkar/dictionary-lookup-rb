require "dictionary_lookup/pearson"

module DictionaryLookup
  class Base
    # Handles a lookup request
    #
    # @param (see Pearson.define)
    # @return (see Pearson.define)
    # @raise (see Pearson.define)
    def self.define(term, config={})
      Pearson.define(term, config)
    end
  end
end
