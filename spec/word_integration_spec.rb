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

describe('add a new word to the list', {:type => :feature}) do
  it('creates a new word, then goes to the words page') do
    visit('/words/new')
    fill_in('word', :with => 'Friday')
    click_on('Add my Word!')
    expect(page).to have_content('Friday')
  end
end

describe('create a word path', {:type => :feature}) do
  it('clicks on a word from the list and goes to the word page') do
    Word.clear
    word = Word.new("Friday", nil)
    word.save
    visit('/words')
    click_on('Friday')
    expect(page).to have_content('The word is: Friday')
  end
end

describe('create an edit path', {:type => :feature}) do
  it('clicks on Edit Word and goes to word edit page') do
    Word.clear
    Definition.clear
    word = Word.new("Friday", nil)
    word.save
    visit('/words/1')
    click_on('Edit Word')
    expect(page).to have_content('Update Friday to be:')
  end
end

describe('deletes a word', {:type => :feature}) do
  it('deletes word with delete button and returns to list of words') do
    Word.clear
    word = Word.new("Friday", nil)
    word.save
    visit('/words/1/edit')
    click_on('Delete Word')
    expect(page).to have_content('There are currently no words to display.')
  end
end

describe('updates a word', {:type => :feature}) do
  it('updates word with update form and returns to list of words') do
    Word.clear
    word = Word.new("Friday", nil)
    word.save
    visit('/words/1/edit')
    fill_in('word', :with => 'Saturday')
    click_on('Update')
    expect(page).to have_content('Saturday')
  end
end

describe('create a definitions path', {:type => :feature}) do
  it('shows a definition on word page when definition is entered') do
    Word.clear
    Definition.clear
    word = Word.new("Friday", nil)
    word.save
    visit('/words')
    click_on('Friday')
    fill_in('definition', :with => "The best day of the week.")
    click_on('Add Definition')
    expect(page).to have_content('Friday: The best day of the week.')
  end
  it('updates a definition that has already been entered', {:type => :feature}) do
    Word.clear
    Definition.clear
    word = Word.new("Friday", nil)
    word.save
    definition = Definition.new("Best day of the week", word.id, nil)
    definition.save
    visit('/words')
    click_on('Friday')
    click_on('Edit Definition')
    fill_in('definition', :with => "The last day of the week.")
    click_on('Update')
    expect(page).to have_content('The last day of the week.')
  end
end

