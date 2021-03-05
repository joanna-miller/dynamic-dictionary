class Word 
  attr_accessor :word

  @@words = {}

  def initialize(word)
    @word = word
  end  

  def ==(word_to_compare)
    self.word == word_to_compare.word
  end 

  def self.all
    @@words.values
  end 

end