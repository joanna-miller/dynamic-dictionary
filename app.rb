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
  redirect to('/')
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

get ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i)
  erb(:edit_word)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  redirect to('/')
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.update(params[:word])
  redirect to('/')
end

get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i)
  erb(:definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i)
  definition = Definition.new(params[:definition], @word.id, nil)
  definition.save
  erb(:word)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:definition], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
