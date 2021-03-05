require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe(Word) do
  
  before(:each) do
    Word.clear
    Definition.clear
  end

  describe('#initialize') do
    it('creates a new instance of Word') do
      new_word = Word.new("project", nil)
      expect(new_word.word).to(eq("project"))
    end
  end

  describe('#==') do
    it('is the same word if it has the same attributes as another word') do
      word1 = Word.new("friday", nil)
      word2 = Word.new("friday", nil)
      expect(word1).to(eq(word2))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a Word instance') do
      word1 = Word.new("friday", nil)
      word1.save
      word2 = Word.new("project", nil)
      word2.save
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('.clear') do
    it('clears all words') do
      word1 = Word.new("friday", nil)
      word1.save
      word2 = Word.new("project", nil)
      word2.save
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a word by id') do
      word1 = Word.new("friday", nil)
      word1.save
      word2 = Word.new("project", nil)
      word2.save
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('#delete') do
    it('deletes a word by id') do
      word1 = Word.new("friday", nil)
      word1.save
      word2 = Word.new("project", nil)
      word2.save
      word1.delete
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#update') do
    it('updates a word by id') do
      word1 = Word.new("friday", nil)
      word1.save
      word1.update("saturday")
      expect(word1.word).to(eq("saturday"))
    end
  end

  describe('#definitions') do
    it('returns a words definitions') do
      word = Word.new("friday", nil)
      word.save
      word_definition = Definition.new("last day of the week", word.id, nil)
      word_definition.save
      word_definition2 = Definition.new("the best day of the week", word.id, nil)
      word_definition2.save
      expect(word.definitions).to(eq([word_definition, word_definition2]))
    end
  end

end