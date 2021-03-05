require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe(Definition) do

  before(:each) do
    Definition.clear
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
    word_definition = Definition.new("last day of the week", @word.id, nil)
    word_definition2 = Definition.new("last day of the week", @word.id, nil)
    expect(word_definition).to(eq(word_definition2))
    end
  end

  describe('.all') do
    it('returns a list of all definitions') do
      word_definition = Definition.new("last day of the week", @word.id, nil)
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a definition') do
      word_definition = Definition.new("last day of the week", @word.id, nil)
      word_definition.save
      expect(Definition.all).to(eq([word_definition]))
    end
  end

  describe('.clear') do
    it('clears all definitions') do
      word_definition = Definition.new("last day of the week", @word.id, nil)
      word_definition.save
      word_definition2 = Definition.new("the best day of the week", @word.id, nil)
      word_definition2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds definition by id') do
      word_definition = Definition.new("last day of the week", @word.id, nil)
      word_definition.save
      word_definition2 = Definition.new("the best day of the week", @word.id, nil)
      word_definition2.save
      expect(Definition.find(word_definition2.id)).to(eq(word_definition2))
    end
  end

  describe('#update') do
    it('updates a definition by id') do
      word_definition = Definition.new("last day of the week", @word.id, nil)
      word_definition.save
      word_definition.update("the best day of the week", @word.id)
      expect(word_definition.definition).to(eq("the best day of the week"))
    end
  end

  describe('#delete') do
    it('deletes a definition by id') do
      word_definition = Definition.new("last day of the week", @word.id, nil)
      word_definition.save
      word_definition2 = Definition.new("the best day of the week", @word.id, nil)
      word_definition2.save
      word_definition.delete
      expect(Definition.all).to(eq([word_definition2]))
    end
  end

  describe('.find_by_word') do
    it('finds definitions for a word') do
      word2 = Word.new("project", nil)
      word2.save
      word_definition = Definition.new("last day of the week", @word.id, nil)
      word_definition.save
      word_definition2 = Definition.new("my own creation", word2.id, nil)
      word_definition2.save
      expect(Definition.find_by_word(word2.id)).to(eq([word_definition2]))      
    end
  end

end