class Definition
  attr_reader :id
  attr_accessor :definition, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(definition, word_id, id)
    @definition = definition
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(def_to_compare)
    (definition == def_to_compare.definition) && (word_id == def_to_compare.word_id)
  end

  def self.all
    @@definitions.values
  end  

end