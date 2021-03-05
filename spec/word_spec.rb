require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe(Word) do
  
  describe('#initialize') do
    it('creates a new instance of Word') do
      new_word = Word.new("project")
      expect(new_word).to(eq(new_word))
    end
  end

end