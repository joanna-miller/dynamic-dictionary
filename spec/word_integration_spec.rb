require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('navigates to the words path', {:type => :feature}) do
  it('navigates to the words homepage') do
    visit('/')
    expect(page).to have_content('Dynamic Dictionary')
  end
  it('navigates to the words homepage') do
    visit('/words')
    expect(page).to have_content('Dynamic Dictionary')
  end
  it('navigates back to words page from word page') do
    Word.clear()
    word = Word.new("Friday", nil)
    word.save
    visit('/words/1')
    click_on('Return to word list')
    expect(page).to have_content('Dynamic Dictionary')
  end

end

describe('create a new words path', {:type => :feature}) do
  it('navigates to the new words page') do
    visit('/')
    click_on('Add a new word!')
    expect(page).to have_content('Add a New Word')
  end
end

describe('adds a new word to the list', {:type => :feature}) do
  it('creates a new word, then goes to the words page') do
    visit('/words/new')
    fill_in('word', :with => 'Friday')
    click_on('Add my Word!')
    expect(page).to have_content('Friday')
  end
end

describe('create a word path', {:type => :feature}) do
  it('clicks on a word from the list and goes to the word page') do
    Word.clear()
    word = Word.new("Friday", nil)
    word.save
    visit('/words')
    click_on('Friday')
    expect(page).to have_content('The word is: Friday')
  end
end