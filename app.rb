require 'sinatra'

class DaysUntilBirthdayApp < Sinatra::Base
  get '/' do
    erb(:index)
  end
end