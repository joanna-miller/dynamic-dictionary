require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe(Word) do
  
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

end