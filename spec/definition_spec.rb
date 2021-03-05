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

  describe('#==') do
    it('is the same definition if it has the same attributes as another definition') do
    word_definition1 = Definition.new("last day of the week", @word.id, nil)
    word_definition2 = Definition.new("last day of the week", @word.id, nil)
    expect(word_definition1).to(eq(word_definition2))
    end
  end

end