require "net/http"
require "json"
require "dictionary_lookup/definition"

module DictionaryLookup
  class Pearson
    # Fetches term definitions from Pearson dictionary API
    #
    # @param term [String] term to be defined
    # @return [Array] an array of DictionaryLookup::Definition objects
    # @raise SocketError if not connected to the internet
    def self.define(term)
      url = "https://api.pearson.com:443/v2/dictionaries/ldoce5/entries?headword=#{term}"
      uri = URI(URI.escape(url))

      response = Net::HTTP.get(uri)
      data = JSON.parse(response)

      # Select definitions that match exactly with the term
      results = data["results"].select{ |d| d["headword"].downcase == term.downcase }

      definitions = []

      results.each do |result|
        part_of_speech = result["part_of_speech"]
        denotation = result["senses"].first["definition"].first
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
