require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :team
    end

    post '/super_hero' do
        @team = Team.new(params[:team])

        params[:team][:superheroes].each do |details|
            Superhero.new(details)
        end

        @superheroes = Superhero.all

        erb :super_hero
    end

end
