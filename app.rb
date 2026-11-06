# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'securerandom'

set :method_override, true

get '/' do
  'Hello Sinatra!'
end
get '/memos' do
  json = File.read('memos.json')
  @memos = JSON.parse(json)

  erb :memos
end
get '/memos/:id/edit' do
  json = File.read('memos.json')
  memos = JSON.parse(json)

  @memo = memos.find { |memo| memo['id'] == params[:id] }

  erb :edit
end

get '/memos/new' do
  erb :new
end

get '/memos/:id' do
  json = File.read('memos.json')
  memos = JSON.parse(json)

  @memo = memos.find { |memo| memo['id'] == params[:id] }

  erb :show
end

post '/memos' do
  title = params[:title]

  json = File.read('memos.json')
  memos = JSON.parse(json)

  memos << {
    'id' => SecureRandom.uuid,
    'title' => title
  }

  File.write('memos.json', JSON.pretty_generate(memos))

  redirect '/memos'
end

patch '/memos/:id' do
  title = params[:title]

  json = File.read('memos.json')
  memos = JSON.parse(json)

  memo = memos.find { |memo| memo['id'] == params[:id] }

  memo['title'] = title

  File.write('memos.json', JSON.pretty_generate(memos))

  redirect "/memos/#{params[:id]}"
end

delete '/memos/:id' do
  json = File.read('memos.json')
  memos = JSON.parse(json)

  memos.delete_if { |memo| memo['id'] == params[:id] }

  File.write('memos.json', JSON.pretty_generate(memos))

  redirect '/memos'
end
