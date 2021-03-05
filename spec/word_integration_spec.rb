require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a words path', {:type => :feature}) do
  it('navigates to the words homepage') do
    visit('/')
    expect(page).to have_content('Dynamic Dictionary')
  end
end