require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a words path', {:type => :feature}) do
  it('navigates to the words homepage') do
    visit('/')
    expect(page).to have_content('Dynamic Dictionary')
  end
  it('navigates to the words homepage') do
    visit('/words')
    expect(page).to have_content('Dynamic Dictionary')
  end
end

describe('creates a new words path', {:type => :feature}) do
  it('navigates to the new words page') do
    visit('/')
    click_on('Add a new word!')
    expect(page).to have_content('Add a New Word')
  end
end

