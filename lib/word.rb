class Word 
  attr_reader :id
  attr_accessor :word

  @@words = {}
  @@total_rows = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
  end  

  def ==(word_to_compare)
    self.word == word_to_compare.word
  end 

  def self.all
    @@words.values
  end 

  def save
    @@words[id] = Word.new(word, id)
  end 

  def self.clear
    @@words = {}
    @@total_rows = 0
  end 

  def self.find(id)
    @@words[id]
  end 
  
  def definitions
    Definition.find_by_word(self.id)
  end  

end