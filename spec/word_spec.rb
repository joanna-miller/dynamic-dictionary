require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe(Word) do
  
  describe('#initialize') do
    it('creates a new instance of Word') do
      new_word = Word.new("project")
      expect(new_word.word).to(eq("project"))
    end
  end

  describe('#==') do
    it('is the same word if it has the same attributes as another word') do
      word1 = Word.new("friday")
      word2 = Word.new("friday")
      expect(word1).to(eq(word2))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

end