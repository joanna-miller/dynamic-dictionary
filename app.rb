require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  redirect to('/')
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  word = params[:word]
  new_word = Word.new(word, nil)
  new_word.save
  @words = Word.all
  redirect to('/')
end
