module DictionaryLookup
  class Definition
    attr_accessor :part_of_speech, :denotation, :examples

    def initialize(part_of_speech, denotation, examples)
      @part_of_speech = part_of_speech
      @denotation = denotation
      @examples = examples
    end
  end
end
