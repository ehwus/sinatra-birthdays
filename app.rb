require 'sinatra'
require 'date'
require_relative './lib/birthday'

class DaysUntilBirthdayApp < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/show-days' do
    birthday_in_2020 = Date.new(2020, params["month"].to_i, params["day"].to_i)
    @user_birthday = Birthday.new(birthday_in_2020)
    erb(:results)
  end
end