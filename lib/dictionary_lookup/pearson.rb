require "net/http"
require "json"
require "dictionary_lookup/definition"

module DictionaryLookup
  class Pearson

    VALID_DICTIONARIES = ["ldoce5", "lasde", "ldec", "wordwise", "laesd", "leasd", "laad3", "laes", "lase", "brep", "brpe"]

    DEFAULT_DICTIONARY = VALID_DICTIONARIES.first

    # Helper method. Returns either a valid dictionary specified through config
    # or the default dictionary
    def self.get_dictionary(config)
      VALID_DICTIONARIES.include?(config[:dictionary]) ?
                                config[:dictionary] : DEFAULT_DICTIONARY
    end

    # Fetches term definitions from Pearson dictionary API
    #
    # @param term [String] term to be defined
    # @param config [Hash] configuration hash, for now supports :dictionary key.
    #   For list of valid values see {DictionaryLookup::Pearson::VALID_DICTIONARIES}
    # @return [Array] an array of {DictionaryLookup::Definition} objects
    # @raise SocketError if not connected to the internet
    def self.define(term, config)
      dictionary = get_dictionary(config)

      url = "https://api.pearson.com/v2/dictionaries/#{dictionary}/entries?headword=#{term}"
      uri = URI(URI.escape(url))

      response = Net::HTTP.get(uri)
      data = JSON.parse(response)

      # Select definitions that match exactly with the term
      results = data["results"].select{ |d| d["headword"].downcase == term.downcase }

      definitions = []

      results.each do |result|
        part_of_speech = result["part_of_speech"]
        # In wordwise dictionary, value of definition is String. Hence the is_a? test
        _definitions = result["senses"].first["definition"]
        denotation = _definitions.is_a?(Array) ? _definitions.first : _definitions
        if result["senses"].first["examples"].nil?
          examples = []
        else
          examples = result["senses"].first["examples"].map{|e| e["text"]}
        end
        definitions << DictionaryLookup::Definition.new(part_of_speech, denotation, examples)
      end

      definitions
    end

  end
end
