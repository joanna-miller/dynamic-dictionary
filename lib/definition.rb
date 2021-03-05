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

  def save
    @@definitions[id] = Definition.new(definition, word_id, id)
  end

  def self.clear
    @@definitions = {}
  end 

  def self.find(id)
    @@definitions[id]
  end

  def update(definition, word_id)
    self.definition = definition
    self.word_id = word_id
    @@definitions[id] = Definition.new(self.definition, self.word_id, self.id)
  end 

  def delete
    @@definitions.delete(self.id)
  end 

  def self.find_by_word(search_word_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == search_word_id
        definitions.push(definition)
      end
    end
    definitions    
  end 

  def word
    Word.find(self.word_id)
  end 

end