require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe(Definition) do

  before(:each) do
    Word.clear
    @word = Word.new("friday", nil)
    @word.save
  end
  
  describe('#initialize') do
    it('creates a new instance of Definition') do
      word_definition = Definition.new("last day of the week", @word.id, nil)
      expect(word_definition.definition).to(eq("last day of the week"))
      expect(word_definition.word_id).to(eq(@word.id))
    end
  end

end